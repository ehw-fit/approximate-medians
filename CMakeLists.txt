cmake_minimum_required(VERSION 3.5)

project(median-validate)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -O3")

set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})


include(ExternalProject)

ExternalProject_Add(libbdd
    SOURCE_DIR ${PROJECT_SOURCE_DIR}/buddy-2.4
    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/buddy-2.4/configure --includedir=${PROJECT_SOURCE_DIR}/lib --libdir=${PROJECT_SOURCE_DIR}/lib
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND make install
)


include_directories("lib")
link_directories("lib")




set(SOURCE_FILES src/fitnessbdd.cxx src/chromosomear.cxx src/main.cxx src/reference.cxx)
add_executable(median-validate ${SOURCE_FILES})

target_link_libraries( median-validate bdd )