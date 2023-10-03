// Include the header file /
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include "shout_handler.h"
// Define the function /
shout_t *shout_stream;

int init_shout(const char *server, const char *port, const char *user, const char *password, const char *mount_point) {
    std::cout << "Initializing libshout..." << std::endl;

    shout_stream = shout_new();
    if (!shout_stream) {
        std::cerr << "shout_new() failed." << std::endl;
        return -1;
    }

    shout_set_host(shout_stream, server);
    shout_set_port(shout_stream, std::atoi(port));
    shout_set_user(shout_stream, user);
    shout_set_password(shout_stream, password);
    shout_set_content_format(shout_stream, SHOUT_FORMAT_OGG, SHOUT_USAGE_UNKNOWN, NULL);
    shout_set_protocol(shout_stream, SHOUT_PROTOCOL_HTTP);
    
    shout_set_mount(shout_stream, mount_point);
    if (shout_open(shout_stream) != SHOUTERR_SUCCESS) {
        std::cerr << "Failed to open Icecast connection. Error: " << shout_get_error(shout_stream) << std::endl;
        std::cerr << "Debugging - shout_open() returned error code: " << shout_get_errno(shout_stream) << std::endl;
        return -1;
    }

    return 0;
}
