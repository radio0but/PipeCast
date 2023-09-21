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

include_directories(${PIPEWIRE_INCLUDE_DIRS} ${SHOUT_INCLUDE_DIRS})

add_executable(IcecastStreamer
    main.cpp
    mainwindow.cpp
    streamer.c
)

target_link_libraries(IcecastStreamer Qt5::Widgets ${PIPEWIRE_LIBRARIES} ${SHOUT_LIBRARIES})
