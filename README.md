# PipeCast Project

## Project Overview

PipeCast is an application designed to capture audio from your system and stream it to an Icecast server. The project is built with Qt for the user interface, PipeWire for audio capture, and libshout for streaming to Icecast. It also uses libvorbis and libogg for audio encoding.

## File Structure

1. **CMakeLists.txt:**
    - Setup for the build environment using CMake.
    - Specifies the minimum required version of CMake, the project name, and the C++ standard to use.
    - Locates and loads settings for required libraries and packages such as Qt5Widgets, libpipewire-0.3, libshout, and libogg.

2. **main.cpp:**
    - Entry point of the application.
    - Initializes a `QApplication` object and a `MainWindow` object, then enters the Qt event loop.

3. **mainwindow.h and mainwindow.cpp:**
    - Define and implement the `MainWindow` class, which is the main GUI window of the application.
    - Slots for handling the `Start Streaming` and `Stop Streaming` button clicks, which in turn call `startStream()` and `stopStream()` functions from `streamer.h`.
    - The GUI contains text fields for user input of server details and buttons to control streaming.

4. **streamer.h and streamer.cpp:**
    - Define and implement the streaming functionality of the application.
    - `startStream()` initializes the streaming process, setting up libshout, PipeWire, and libvorbis/libogg libraries, connecting to the Icecast server, and beginning capturing and streaming audio.
    - `stopStream()` terminates the streaming process, clears the Vorbis and Ogg structures, closes the shout stream, and cleans up PipeWire resources.

5. **AdaptiveBuffer:**
    - Manages a buffer that can adapt its size based on the amount of data being processed to ensure efficient handling of varying amounts of audio data.

## Current Project Status

The project is in development and is not yet functioning as intended. We are open to contributions and assistance to move the project forward. Feel free to explore the code and provide any feedback or help to improve the functionality and fix existing issues.

## Contributing

If you are interested in contributing, feel free to fork the repository and submit pull requests. Any help in making this project operational is highly appreciated!


