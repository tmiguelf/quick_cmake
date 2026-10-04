cmake_minimum_required(VERSION 4.2.3)
project(headerLib VERSION 1.0.0 LANGUAGES CXX)

set(HEADER_FILE_ONLY ON)

add_library(${PROJECT_NAME} INTERFACE)

target_include_directories(${PROJECT_NAME} INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/include")
