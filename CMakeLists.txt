cmake_minimum_required(VERSION 3.10)
project(IcecastStreamer)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt5Widgets REQUIRED)
find_package(PkgConfig REQUIRED)
find_package(Qt5 COMPONENTS Widgets REQUIRED)


pkg_check_modules(PIPEWIRE REQUIRED libpipewire-0.3)
pkg_check_modules(SHOUT REQUIRED shout)
pkg_check_modules(OGG REQUIRED ogg)

include_directories(${PIPEWIRE_INCLUDE_DIRS} ${SHOUT_INCLUDE_DIRS} ${OGG_INCLUDE_DIRS})

add_executable(IcecastStreamer
    main.cpp
    mainwindow.cpp
    streamer.cpp  # <-- Change here
)

target_link_libraries(IcecastStreamer vorbis vorbisenc Qt5::Widgets /usr/lib/libpipewire-0.3.so /usr/lib/libshout.so ${OGG_LIBRARIES})
