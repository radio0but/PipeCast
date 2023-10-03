#ifndef SHOUT_HANDLER_H
#define SHOUT_HANDLER_H

#include <shout/shout.h>

extern shout_t *shout_stream;  // Declare shout_stream here

int init_shout(const char *server, const char *port, const char *user, const char *password, const char *mount_point);

#endif  // SHOUT_HANDLER_H