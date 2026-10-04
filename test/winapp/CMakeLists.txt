cmake_minimum_required(VERSION 4.2.3)
project(winapp VERSION 1.0.0 LANGUAGES CXX)

file(GLOB_RECURSE SOURCE_FILES CONFIGURE_DEPENDS 
	"./src/*.cpp"
)

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
	enable_language(RC)
	set(RESOURCE_FILES  "./resources/version.rc" )
else()
	set(RESOURCE_FILES "")
endif()

add_executable(${PROJECT_NAME} WIN32 ${SOURCE_FILES} ${RESOURCE_FILES})

target_include_directories(${PROJECT_NAME} PRIVATE "${CMAKE_SOURCE_DIR}/extension/include" )

#target_include_directories(${PROJECT_NAME} PRIVATE "$<TARGET_PROPERTY:testLib,INTERFACE_INCLUDE_DIRECTORIES>")
target_link_libraries(${PROJECT_NAME} LINK_PRIVATE staticLib)
target_link_libraries(${PROJECT_NAME} LINK_PRIVATE headerLib)
target_link_libraries(${PROJECT_NAME} LINK_PRIVATE dynamicLib)

quick_default_post_config()
