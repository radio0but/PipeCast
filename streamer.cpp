extern "C" {
    #include <vorbis/vorbisenc.h>
    #include <pipewire/pipewire.h>
    #include <shout/shout.h>
}
#include <memory>
#include "streamer.h"
#include "shout_handler.h"
#include "adaptive_buffer.h"
#include <iostream>
#include <cstdlib>
#include <algorithm>
#include <spa/pod/builder.h>
#include <pipewire/extensions/metadata.h>
#include <spa/param/audio/format-utils.h>
#include <spa/param/param.h>
#include <pipewire/core.h>

// Declare the function registry_event_global before its first usage
void registry_event_global(void *data, uint32_t id, uint32_t parent_id, const char* type, uint32_t version, const struct spa_dict *props);
// in shout_handler.h or shout_handler.cpp
extern shout_t *shout_stream;
// Variables and constants for Vorbis encoding
static ogg_stream_state os; 
static ogg_page         og; 
static ogg_packet       op; 

static vorbis_info      vi; 
static vorbis_comment   vc; 
static vorbis_dsp_state vd; 
static vorbis_block     vb; 
static pw_main_loop *pipewire_loop;
static pw_core *core;
static pw_stream *stream;
static pw_context *context;

#define READ 1024

#define MAX_BUFFER_SIZE 4194304  // or whatever maximum size you'd like
#define MIN_BUFFER_SIZE 8192   // or whatever minimum size you'd like

signed char readbuffer[READ*4+44]; 
  // Default value
static struct spa_hook stream_listener;

static struct spa_hook core_event_listener;
static uint32_t virtualSourceNodeId = PW_ID_ANY;
static uint32_t n_channels = 2;  // default to stereo, but you can later modify this

static void on_stream_state_changed(void *user_data, enum pw_stream_state old, enum pw_stream_state state, const char *error);
static void on_process(void *user_data);
extern int init_shout(const char *server, const char *port, const char *user, const char *password, const char *mount_point);
static const struct spa_pod *global_format = NULL;

// Definition of format_changed callback
static void on_format_changed(void *user_data, const struct spa_pod *format) {
    global_format = format;
}

// Your pw_stream_events structure

void print_audio_snippet(signed char *data, size_t size) {
    std::cout << "Audio Data Snippet: ";
    for (size_t i = 0; i < std::min(size_t(10), size); i++) {
        std::cout << static_cast<int>(data[i]) << " ";
    }
    std::cout << "..." << std::endl;
}


static const pw_registry_events registry_events = {
    PW_VERSION_REGISTRY_EVENTS,
    .global = registry_event_global
};
static const pw_stream_events stream_events = {
    PW_VERSION_STREAM_EVENTS,
    .state_changed = on_stream_state_changed,
    .process = on_process
};

uint32_t create_pipe_cast_node(pw_core *core) {
    uint8_t buffer[1024];

    struct pw_properties *props;
    struct spa_pod_builder b = SPA_POD_BUILDER_INIT(buffer, sizeof(buffer));
    const struct spa_pod *params[1];
    char node_name[] = "PipeCast";

    props = pw_properties_new(
        PW_KEY_MEDIA_TYPE, "Audio",
        PW_KEY_MEDIA_CATEGORY, "Capture",
        PW_KEY_MEDIA_ROLE, "Music",
        PW_KEY_NODE_NAME, node_name,
        PW_KEY_NODE_DESCRIPTION, "PipeCast Audio Streaming",
        NULL);

    params[0] = (struct spa_pod*)spa_pod_builder_add_object(
        &b,
        SPA_TYPE_OBJECT_Format, SPA_PARAM_EnumFormat,
        SPA_FORMAT_mediaType, SPA_POD_Id(SPA_MEDIA_TYPE_audio),
        SPA_FORMAT_mediaSubtype, SPA_POD_Id(SPA_MEDIA_SUBTYPE_raw),
        SPA_FORMAT_AUDIO_format, SPA_POD_Id(SPA_AUDIO_FORMAT_S16),
        SPA_FORMAT_AUDIO_channels, SPA_POD_Int(n_channels));

    pw_stream_connect(stream, PW_DIRECTION_INPUT, PW_ID_ANY, PW_STREAM_FLAG_MAP_BUFFERS, params, 1);

    // Let the main loop run for a bit to process events.
    pw_main_loop_run(pipewire_loop);

    // Note: The node_id is captured by the core event listener on_core_global.
    // So you don't need to return it directly here. It's stored in the virtualSourceNodeId variable.
    return virtualSourceNodeId;  
}


void startStream(const char *server, const char *port, const char *user, const char *password, const char *mount_point) {
    std::cout << "Starting Stream..." << std::endl;

    if (init_shout(server, port, user, password, mount_point) < 0) {
        std::cerr << "Failed to initialize Icecast." << std::endl;
        return;
    }

    std::cout << "Initializing PipeWire..." << std::endl;

    pw_init(NULL, NULL);
     pipewire_loop = pw_main_loop_new(NULL);
    if (!pipewire_loop) {
        std::cerr << "Error initializing PipeWire main loop." << std::endl;
        return;
    }
    
    context = pw_context_new(pw_main_loop_get_loop(pipewire_loop), NULL, 0);
    if (!context) {
        std::cerr << "Error creating PipeWire context." << std::endl;
        return;
    }

    core = pw_context_connect(context, NULL, 0);
    if (!core) {
        std::cerr << "Error connecting to PipeWire core." << std::endl;
        return;
    }

    stream = pw_stream_new(core, "PipeCast Stream", NULL);
    if (!stream) {
        std::cerr << "Failed to create PipeWire stream." << std::endl;
        return;
    }

    pw_stream_add_listener(stream, &stream_listener, &stream_events, nullptr);

    pw_registry *registry = pw_core_get_registry(core, PW_VERSION_REGISTRY, 0);
    struct spa_hook registry_listener;
    pw_registry_add_listener(registry, &registry_listener, &registry_events, nullptr);

    uint32_t nodeId = create_pipe_cast_node(core);
    if (nodeId == PW_ID_ANY) {
        std::cerr << "Failed to create PipeCast node." << std::endl;
        return;
    }
    pw_stream_connect(stream, PW_DIRECTION_INPUT, nodeId, PW_STREAM_FLAG_MAP_BUFFERS, nullptr, 0);
    // Initialize Vorbis after connecting the PipeWire stream
    vorbis_info_init(&vi);

    if (vorbis_encode_init_vbr(&vi, n_channels, 44100, 0.4)) {  // Use n_channels instead of hard-coded value
        std::cerr << "Failed to initialize Vorbis encoder." << std::endl;
        return;
    }

    vorbis_comment_init(&vc);
    vorbis_comment_add_tag(&vc, "ENCODER", "ChatGPT Streamer");

    vorbis_analysis_init(&vd, &vi);
    vorbis_block_init(&vd, &vb);

    ogg_stream_init(&os, rand()); // Unique ID using random number

    pw_main_loop_run(pipewire_loop);
}


static void on_process(void *user_data) {
    std::cout << "Processing stream data..." << std::endl;

    pw_buffer *buf = const_cast<pw_buffer*>(pw_stream_dequeue_buffer(stream));
    struct spa_buffer *buffer;

    if (!buf) {
        std::cerr << "Failed to dequeue buffer." << std::endl;
        return;
    }

    buffer = buf->buffer;

    uint32_t node_id = pw_stream_get_node_id(stream);
    if (node_id == PW_ID_ANY) {
        std::cerr << "Failed to get node id." << std::endl;
        return;
    }

    // Check if global_format is non-null before proceeding
    if (global_format == NULL) {
        std::cerr << "global_format is NULL." << std::endl;
        return;
    }

    struct spa_audio_info_raw info;
    if (spa_format_audio_raw_parse(global_format, &info) < 0) {
        std::cerr << "Failed to parse format." << std::endl;
        return;
    }

    uint32_t bytes_per_sample = SPA_AUDIO_FORMAT_IS_PLANAR(info.format) ? info.channels : 1;
    int num_samples = buffer->datas[0].chunk->size / (info.channels * bytes_per_sample);


    // Adjust buffer size based on how full it is
    
    if (buffer->datas[0].data && buffer->datas[0].chunk->size > 0) {
        float buffer_fullness = static_cast<float>(buffer->datas[0].chunk->size) / static_cast<float>(AdaptiveBuffer::adaptive_buffer.get_size());
        
        if (buffer_fullness > 0.8f && AdaptiveBuffer::adaptive_buffer.get_size() < MAX_BUFFER_SIZE) {
            AdaptiveBuffer::adaptive_buffer.resize(AdaptiveBuffer::AdaptiveBuffer::adaptive_buffer.get_size() * 1.5);
        } else if (buffer_fullness < 0.3f && AdaptiveBuffer::adaptive_buffer.get_size() > MIN_BUFFER_SIZE) {
           AdaptiveBuffer::adaptive_buffer.resize(AdaptiveBuffer::AdaptiveBuffer::adaptive_buffer.get_size() * 0.5);
        }

        // Calculate the number of samples.
        int num_samples = buffer->datas[0].chunk->size / (n_channels * bytes_per_sample);

        float **buffer_vorbis = vorbis_analysis_buffer(&vd, num_samples);
        // Check for valid number of samples.
        if (num_samples <= 0) {
            std::cerr << "Invalid number of samples." << std::endl;
            return;
        }

        std::cout << "Buffer Size: " << AdaptiveBuffer::adaptive_buffer.get_size() << " Data Size: " << buffer->datas[0].chunk->size << std::endl;
        print_audio_snippet((signed char*) buffer->datas[0].data, buffer->datas[0].chunk->size);

        // Getting the PCM data from the PipeWire buffer
        signed char* pcm_data = (signed char*) buffer->datas[0].data;

        // Assuming 16-bit samples
        int last_i = 0;
        for (int i = 0; i < buffer->datas[0].chunk->size/4; i++) {
            buffer_vorbis[0][i] = ((pcm_data[i*4+1]<<8)|
                                   (0x00ff&(int)pcm_data[i*4]))/32768.f;
            buffer_vorbis[1][i] = ((pcm_data[i*4+3]<<8)|
                                   (0x00ff&(int)pcm_data[i*4+2]))/32768.f;
            last_i = i;
        }

        vorbis_analysis_wrote(&vd, last_i);
        
        while(vorbis_analysis_blockout(&vd, &vb) == 1) {
            vorbis_analysis(&vb, &op);
            vorbis_bitrate_addblock(&vb);

            while(vorbis_bitrate_flushpacket(&vd, &op)) {
                ogg_stream_packetin(&os, &op);

                while(1) {
                    int result = ogg_stream_pageout(&os, &og);
                    if(result==0) break;

                    // Send the OGG data to Icecast
                    int ret;
                    ret = shout_send(shout_stream, og.header, og.header_len);
                    if (ret != SHOUTERR_SUCCESS) {
                        std::cerr << "Error sending header data: " << shout_get_error(shout_stream) << std::endl;
                    }

                    ret = shout_send(shout_stream, og.body, og.body_len);
                    if (ret != SHOUTERR_SUCCESS) {
                        std::cerr << "Error sending body data: " << shout_get_error(shout_stream) << std::endl;
                    }

                }
            }
        }
        
        pw_stream_queue_buffer(stream, buf);
    }
}


// On stream state changed event, don't quit the main loop on PAUSED state. It might disrupt the process.
static void on_stream_state_changed(void *user_data, enum pw_stream_state old, enum pw_stream_state state, const char *error) {
    switch (state) {
        case PW_STREAM_STATE_PAUSED:
            std::cout << "Stream is paused." << std::endl;
            break;
        case PW_STREAM_STATE_ERROR:
            std::cerr << "Error while creating PipeCast node: " << error << std::endl;
            pw_main_loop_quit(pipewire_loop);
            break;
        default:
            break;
    }
}



// This is the function that will be called for each global object.
void registry_event_global(void *data, uint32_t id, uint32_t parent_id,
                           const char* type, uint32_t version, const struct spa_dict *props) {
    const char *str;
    std::cout << "Debug: Found object with ID: " << id << " and type: " << type << std::endl;
    if ((str = spa_dict_lookup(props, PW_KEY_MEDIA_NAME)) && strcmp(str, "PipeCast") == 0) {
        std::cout << "Debug: Found PipeCast with ID: " << id << std::endl;
        virtualSourceNodeId = id;
    }
}







void stopStream() {
    std::cout << "Stopping Stream..." << std::endl;

    vorbis_analysis_wrote(&vd, 0);

    while(vorbis_analysis_blockout(&vd, &vb) == 1) {
        vorbis_analysis(&vb, &op);
        vorbis_bitrate_addblock(&vb);

        while(vorbis_bitrate_flushpacket(&vd, &op)) {
            ogg_stream_packetin(&os, &op);
            while(1) {
                if(ogg_stream_pageout(&os, &og) == 0) {
                    break;
                }
                int ret;
                ret = shout_send(shout_stream, og.header, og.header_len);
                if (ret != SHOUTERR_SUCCESS) {
                    std::cerr << "Error sending header data: " << shout_get_error(shout_stream) << std::endl;
                }

                ret = shout_send(shout_stream, og.body, og.body_len);
                if (ret != SHOUTERR_SUCCESS) {
                    std::cerr << "Error sending body data: " << shout_get_error(shout_stream) << std::endl;
                }

            }
        }
    }

 ogg_stream_clear(&os);
    vorbis_block_clear(&vb);
    vorbis_dsp_clear(&vd);
    vorbis_comment_clear(&vc);
    vorbis_info_clear(&vi);

    if (shout_stream) {
        shout_close(shout_stream);
        shout_free(shout_stream);
        shout_stream = NULL;
    }

    // Added PipeWire cleanup
    pw_stream_destroy(stream);
    pw_core_disconnect(core);
    pw_context_destroy(context);
    pw_main_loop_destroy(pipewire_loop);
    
    pw_deinit();  // Deinitialize PipeWire

    // Add any additional cleanup code here if necessary

    pw_main_loop_quit(pipewire_loop);
}