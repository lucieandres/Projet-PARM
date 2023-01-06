cmake_minimum_required(VERSION 3.17)
project(controller_cpp)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(controller_cpp
        load_store.cpp
        data_processing.cpp
        main.cpp
        shift_add_sub_mov.cpp
        tester.cpp)
