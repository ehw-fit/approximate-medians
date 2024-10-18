cmake_minimum_required(VERSION 3.0)

file(GLOB BUDDY_SOURCES "./src/*.c" "./src/*.cxx")

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/src" ${CMAKE_CURRENT_SOURCE_DIR})

add_library(buddy ${BUDDY_SOURCES})
