cmake_minimum_required(VERSION 4.2.3)
project(dynamicLib VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
	add_compile_options(/W4 /Zc:__cplusplus /Zc:strictStrings)
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
	add_compile_options(-Wall -Wextra -Wpedantic -Werror)
else()
	message( FATAL_ERROR "Compiler not supported")
endif()

file(GLOB_RECURSE SOURCE_FILES CONFIGURE_DEPENDS 
	"./src/*.cpp"
)

add_compile_definitions(NOMINMAX)
add_compile_definitions(_dynamicLib_EXPORTS_)

add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES})

target_include_directories(${PROJECT_NAME} PRIVATE "${CMAKE_SOURCE_DIR}/extension/include" )

target_include_directories(${PROJECT_NAME} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include" )


target_link_libraries(${PROJECT_NAME} LINK_PRIVATE staticLib)
target_link_libraries(${PROJECT_NAME} LINK_PRIVATE headerLib)
