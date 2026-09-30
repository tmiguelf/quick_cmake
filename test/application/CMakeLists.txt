cmake_minimum_required(VERSION 4.2.3)
project(application VERSION 1.0.0)
enable_language(CXX)

quick_add_default_presets()

file(GLOB_RECURSE SOURCE_FILES CONFIGURE_DEPENDS 
	"./src/*.cpp"
)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

target_include_directories(${PROJECT_NAME} PRIVATE "${CMAKE_SOURCE_DIR}/extension/include" )

#target_include_directories(${PROJECT_NAME} PRIVATE "$<TARGET_PROPERTY:testLib,INTERFACE_INCLUDE_DIRECTORIES>")
target_link_libraries(${PROJECT_NAME} LINK_PRIVATE staticLib)
target_link_libraries(${PROJECT_NAME} LINK_PRIVATE headerLib)
target_link_libraries(${PROJECT_NAME} LINK_PRIVATE dynamicLib)

quick_set_default_config("exec")
