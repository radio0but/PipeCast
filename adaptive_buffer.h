#ifndef ADAPTIVE_BUFFER_H
#define ADAPTIVE_BUFFER_H

#include <cstddef>

class AdaptiveBuffer {
public:
    static AdaptiveBuffer adaptive_buffer;
    AdaptiveBuffer(size_t initial_size);
    ~AdaptiveBuffer();
    void resize(size_t new_size);
    signed char* get_data();
    size_t get_size() const;

private:
    size_t size;
    signed char* data;
};

#endif  // ADAPTIVE_BUFFER_H
