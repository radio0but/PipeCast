# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/arch-user/PipeCast

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/arch-user/PipeCast/build

# Include any dependencies generated for this target.
include CMakeFiles/IcecastStreamer.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/IcecastStreamer.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/IcecastStreamer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/IcecastStreamer.dir/flags.make

CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.o: CMakeFiles/IcecastStreamer.dir/flags.make
CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.o: IcecastStreamer_autogen/mocs_compilation.cpp
CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.o: CMakeFiles/IcecastStreamer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/arch-user/PipeCast/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.o -MF CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.o -c /home/arch-user/PipeCast/build/IcecastStreamer_autogen/mocs_compilation.cpp

CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arch-user/PipeCast/build/IcecastStreamer_autogen/mocs_compilation.cpp > CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.i

CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arch-user/PipeCast/build/IcecastStreamer_autogen/mocs_compilation.cpp -o CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.s

CMakeFiles/IcecastStreamer.dir/main.cpp.o: CMakeFiles/IcecastStreamer.dir/flags.make
CMakeFiles/IcecastStreamer.dir/main.cpp.o: /home/arch-user/PipeCast/main.cpp
CMakeFiles/IcecastStreamer.dir/main.cpp.o: CMakeFiles/IcecastStreamer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/arch-user/PipeCast/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/IcecastStreamer.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/IcecastStreamer.dir/main.cpp.o -MF CMakeFiles/IcecastStreamer.dir/main.cpp.o.d -o CMakeFiles/IcecastStreamer.dir/main.cpp.o -c /home/arch-user/PipeCast/main.cpp

CMakeFiles/IcecastStreamer.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/IcecastStreamer.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arch-user/PipeCast/main.cpp > CMakeFiles/IcecastStreamer.dir/main.cpp.i

CMakeFiles/IcecastStreamer.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/IcecastStreamer.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arch-user/PipeCast/main.cpp -o CMakeFiles/IcecastStreamer.dir/main.cpp.s

CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.o: CMakeFiles/IcecastStreamer.dir/flags.make
CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.o: /home/arch-user/PipeCast/mainwindow.cpp
CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.o: CMakeFiles/IcecastStreamer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/arch-user/PipeCast/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.o -MF CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.o.d -o CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.o -c /home/arch-user/PipeCast/mainwindow.cpp

CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arch-user/PipeCast/mainwindow.cpp > CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.i

CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arch-user/PipeCast/mainwindow.cpp -o CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.s

CMakeFiles/IcecastStreamer.dir/streamer.cpp.o: CMakeFiles/IcecastStreamer.dir/flags.make
CMakeFiles/IcecastStreamer.dir/streamer.cpp.o: /home/arch-user/PipeCast/streamer.cpp
CMakeFiles/IcecastStreamer.dir/streamer.cpp.o: CMakeFiles/IcecastStreamer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/arch-user/PipeCast/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/IcecastStreamer.dir/streamer.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/IcecastStreamer.dir/streamer.cpp.o -MF CMakeFiles/IcecastStreamer.dir/streamer.cpp.o.d -o CMakeFiles/IcecastStreamer.dir/streamer.cpp.o -c /home/arch-user/PipeCast/streamer.cpp

CMakeFiles/IcecastStreamer.dir/streamer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/IcecastStreamer.dir/streamer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arch-user/PipeCast/streamer.cpp > CMakeFiles/IcecastStreamer.dir/streamer.cpp.i

CMakeFiles/IcecastStreamer.dir/streamer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/IcecastStreamer.dir/streamer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arch-user/PipeCast/streamer.cpp -o CMakeFiles/IcecastStreamer.dir/streamer.cpp.s

CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.o: CMakeFiles/IcecastStreamer.dir/flags.make
CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.o: /home/arch-user/PipeCast/shout_handler.cpp
CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.o: CMakeFiles/IcecastStreamer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/arch-user/PipeCast/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.o -MF CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.o.d -o CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.o -c /home/arch-user/PipeCast/shout_handler.cpp

CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arch-user/PipeCast/shout_handler.cpp > CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.i

CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arch-user/PipeCast/shout_handler.cpp -o CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.s

CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.o: CMakeFiles/IcecastStreamer.dir/flags.make
CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.o: /home/arch-user/PipeCast/adaptive_buffer.cpp
CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.o: CMakeFiles/IcecastStreamer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/arch-user/PipeCast/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.o -MF CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.o.d -o CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.o -c /home/arch-user/PipeCast/adaptive_buffer.cpp

CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arch-user/PipeCast/adaptive_buffer.cpp > CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.i

CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arch-user/PipeCast/adaptive_buffer.cpp -o CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.s

# Object files for target IcecastStreamer
IcecastStreamer_OBJECTS = \
"CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/IcecastStreamer.dir/main.cpp.o" \
"CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.o" \
"CMakeFiles/IcecastStreamer.dir/streamer.cpp.o" \
"CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.o" \
"CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.o"

# External object files for target IcecastStreamer
IcecastStreamer_EXTERNAL_OBJECTS =

IcecastStreamer: CMakeFiles/IcecastStreamer.dir/IcecastStreamer_autogen/mocs_compilation.cpp.o
IcecastStreamer: CMakeFiles/IcecastStreamer.dir/main.cpp.o
IcecastStreamer: CMakeFiles/IcecastStreamer.dir/mainwindow.cpp.o
IcecastStreamer: CMakeFiles/IcecastStreamer.dir/streamer.cpp.o
IcecastStreamer: CMakeFiles/IcecastStreamer.dir/shout_handler.cpp.o
IcecastStreamer: CMakeFiles/IcecastStreamer.dir/adaptive_buffer.cpp.o
IcecastStreamer: CMakeFiles/IcecastStreamer.dir/build.make
IcecastStreamer: /usr/lib/libQt5Widgets.so.5.15.10
IcecastStreamer: /usr/lib/libpipewire-0.3.so
IcecastStreamer: /usr/lib/libshout.so
IcecastStreamer: /usr/lib/libQt5Gui.so.5.15.10
IcecastStreamer: /usr/lib/libQt5Core.so.5.15.10
IcecastStreamer: CMakeFiles/IcecastStreamer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/arch-user/PipeCast/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable IcecastStreamer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/IcecastStreamer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/IcecastStreamer.dir/build: IcecastStreamer
.PHONY : CMakeFiles/IcecastStreamer.dir/build

CMakeFiles/IcecastStreamer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/IcecastStreamer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/IcecastStreamer.dir/clean

CMakeFiles/IcecastStreamer.dir/depend:
	cd /home/arch-user/PipeCast/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arch-user/PipeCast /home/arch-user/PipeCast /home/arch-user/PipeCast/build /home/arch-user/PipeCast/build /home/arch-user/PipeCast/build/CMakeFiles/IcecastStreamer.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/IcecastStreamer.dir/depend

