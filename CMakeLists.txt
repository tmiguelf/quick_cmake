cmake_minimum_required(VERSION 4.2.3)
project(QuickTest)


set(INFO_CONFIG "${CMAKE_SYSTEM_NAME}_${CMAKE_CXX_COMPILER_ID}_${CMAKE_SYSTEM_PROCESSOR}_${CMAKE_BUILD_TYPE}")
#set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/out/${INFO_CONFIG}/lib")
set(CMAKE_PDB_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/out/${INFO_CONFIG}/pdb")
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/runtime/${INFO_CONFIG}")
#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")
set(CMAKE_INSTALL_PREFIX "${PROJECT_SOURCE_DIR}/runtime/${INFO_CONFIG}")


include("${CMAKE_CURRENT_SOURCE_DIR}/quick.cmake")
quick_add_collection_presets()

add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test/headerLib")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test/staticLib")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test/dynamicLib")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test/application")

install(TARGETS dynamicLib application DESTINATION "./")

if(CMAKE_SYSTEM_NAME STREQUAL "Windows") 
	add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test/winapp")
	install(TARGETS winapp DESTINATION "./")
endif()
