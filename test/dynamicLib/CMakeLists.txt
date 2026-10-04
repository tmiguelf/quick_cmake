cmake_minimum_required(VERSION 4.2.3)
project(dynamicLib VERSION 1.0.0 LANGUAGES CXX)

file(GLOB_RECURSE SOURCE_FILES CONFIGURE_DEPENDS 
	"./src/*.cpp"
)

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
	enable_language(RC)
	set(RESOURCE_FILES  "./resources/version.rc" )
else()
	set(RESOURCE_FILES "")
endif()

add_compile_definitions(_dynamicLib_EXPORTS_)

add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES} ${RESOURCE_FILES})

target_include_directories(${PROJECT_NAME} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include" )

target_link_libraries(${PROJECT_NAME} LINK_PRIVATE staticLib)
target_link_libraries(${PROJECT_NAME} LINK_PRIVATE headerLib)

quick_default_post_config()
