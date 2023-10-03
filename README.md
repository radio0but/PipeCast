# PipeCast: Streaming Client Application

PipeCast is a streaming client designed to capture audio and stream it to an Icecast server. The application provides a user-friendly graphical interface that enables users to input the necessary server details and control the streaming process. Leveraging the Qt framework for GUI, PipeWire for audio capture, and libshout, libvorbis, and libogg for encoding and streaming audio data, the app encompasses an adaptive buffer strategy to manage audio data flow efficiently and implements comprehensive error handling to ensure robust operation.

## Code Overview

### adaptive_buffer.cpp / adaptive_buffer.h

`AdaptiveBuffer` is a class encapsulating a dynamically resizeable buffer to manage audio data. 

- `AdaptiveBuffer(size_t initial_size)`: Constructor initializing the buffer with a specified size.
- `~AdaptiveBuffer()`: Destructor releasing the allocated memory.
- `resize(size_t new_size)`: Resizes the buffer to the specified new size.
- `get_data()`: Returns a pointer to the buffer data.
- `get_size() const`: Returns the current size of the buffer.

### shout_handler.cpp / shout_handler.h

Handles the initialization and communication with the Icecast server using libshout.

- `init_shout(const char *server, const char *port, const char *user, const char *password, const char *mount_point)`: Initializes libshout with the server details.

### main.cpp

The entry point of the application which creates a QApplication and MainWindow instance, and enters the Qt event loop.

### mainwindow.cpp / mainwindow.h

`MainWindow` is a class that sets up the GUI, captures user input, and interacts with the streaming functionality.

- `startStreaming()`: Captures server details from the UI and starts streaming.
- `stopStreaming()`: Stops the streaming process.

### streamer.cpp / streamer.h

Encapsulates the core streaming functionality.

- `startStream(const char *server, const char *port, const char *user, const char *password, const char *mount_point)`: Initializes the streaming process.
- `stopStream()`: Halts the streaming process and cleans up resources.
- `on_process(void *user_data)`: Processes audio data, encodes it, and sends it to the Icecast server.
- `on_stream_state_changed(void *user_data, enum pw_stream_state old, enum pw_stream_state state, const char *error)`: Handles stream state changes.
- `registry_event_global(void *data, uint32_t id, uint32_t parent_id, const char* type, uint32_t version, const struct spa_dict *props)`: Handles global objects in the PipeWire registry.

### CMakeLists.txt

Configuration file for building the project using CMake. Specifies dependencies, source files, and linking settings.

## Current State and Contribution

The application is currently in development and is not fully functional yet. We are open to contributions. Feel free to fork the project, make improvements, and submit a pull request.



