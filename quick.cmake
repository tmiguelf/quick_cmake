include_guard(GLOBAL)
cmake_minimum_required(VERSION 4.2.3)

function(quick_add_collection_presets)
	set(CMAKE_CXX_STANDARD 23 PARENT_SCOPE)
	set(CMAKE_CXX_STANDARD_REQUIRED True PARENT_SCOPE)
	set(CMAKE_CXX_FLAGS "" PARENT_SCOPE)
endfunction()

function(quick_default_post_config) #build_type

	if(CMAKE_BUILD_TYPE STREQUAL "Debug")
		target_compile_definitions(${PROJECT_NAME} PRIVATE "DEBUG")
	endif()

	if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
		message("Linux")
	elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
		include("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/os/windows.cmake")
		quick_add_win_post_config()
	else()
		message( FATAL_ERROR "Unsuported OS \"${CMAKE_SYSTEM_NAME}\"")
	endif()

	if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
		include("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/compiler/gcc/gcc.cmake")
		quick_add_gcc_post_config()
	elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
		include("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/compiler/clang/clang.cmake")
		quick_add_clang_post_config()
	elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
		include("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/compiler/msvc/msvc.cmake")
		quick_add_msvc_post_config()
	else()
		message( FATAL_ERROR "Compiler \"${CMAKE_CXX_COMPILER_ID}\" not supported")
	endif()

	
	if((CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64") OR (CMAKE_SYSTEM_PROCESSOR STREQUAL "AMD64"))
	elseif((CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64") OR (CMAKE_SYSTEM_PROCESSOR STREQUAL "ARM64"))
	else()
		message( FATAL_ERROR "Arch \"${CMAKE_SYSTEM_PROCESSOR}\" not supported")
	endif()

	target_include_directories(${PROJECT_NAME} PRIVATE "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/extension/include" )
	target_compile_definitions(${PROJECT_NAME} PRIVATE "NOMINMAX")

endfunction()
