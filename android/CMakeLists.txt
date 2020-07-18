cmake_minimum_required(VERSION 3.6.0-rc2)
project(clogger)

add_library( logan

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
        ../ios/Classes/cloger_logan.c)

SET (CMAKE_C_FLAGS_DEBUG          "-g")
SET (CMAKE_C_FLAGS_RELEASE        "-O2 -DNDEBUG")

set(EXTERN_DIR ../ios/Classes/logan)

add_subdirectory(${EXTERN_DIR} clogan.out)

include_directories(${EXTERN_DIR} logg)
link_directories(clogan.out)

find_library( # Sets the name of the path variable.
        log-lib

        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log )

target_link_libraries(logan ${log-lib} z clogan)