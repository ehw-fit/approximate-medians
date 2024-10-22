cmake_minimum_required(VERSION 3.0)

file(GLOB BUDDY_SOURCES "./src/*.c" "./src/*.cxx")

add_library(buddy ${BUDDY_SOURCES})

target_include_directories(buddy PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)
target_include_directories(buddy PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
