#include "adaptive_buffer.h"

AdaptiveBuffer AdaptiveBuffer::adaptive_buffer(1048576);

AdaptiveBuffer::AdaptiveBuffer(size_t initial_size)
    : size(initial_size), data(new signed char[initial_size * 4 + 44]) {}

AdaptiveBuffer::~AdaptiveBuffer() {
    delete[] data;
}

void AdaptiveBuffer::resize(size_t new_size) {
    delete[] data;
    size = new_size;
    data = new signed char[new_size * 4 + 44];
}

signed char* AdaptiveBuffer::get_data() {
    return data;
}

size_t AdaptiveBuffer::get_size() const {
    return size;
}
