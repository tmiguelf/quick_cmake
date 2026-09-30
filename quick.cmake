include_guard(GLOBAL)
cmake_minimum_required(VERSION 4.2.3)

function(quick_add_default_presets)
	message(STATUS "Project Name = ${PROJECT_NAME}")
	set(CMAKE_CXX_STANDARD 23 PARENT_SCOPE)
	set(CMAKE_CXX_STANDARD_REQUIRED True PARENT_SCOPE)
endfunction()

function(quick_set_default_config build_type)

	message(STATUS "Host OS = \"${CMAKE_HOST_SYSTEM_NAME}\"")
	message(STATUS "target OS = \"${CMAKE_SYSTEM_NAME}\"")
	message(STATUS "Compiler = \"${CMAKE_CXX_COMPILER_ID}\"")
	message(STATUS "Type = \"${CMAKE_BUILD_TYPE}\"")
	message(STATUS "CMAKE_SYSTEM_PROCESSOR = \"${CMAKE_SYSTEM_PROCESSOR}\"")
	message(STATUS "CMAKE_HOST_SYSTEM_PROCESSOR = \"${CMAKE_HOST_SYSTEM_PROCESSOR}\"")

	if(build_type STREQUAL "staticlib")
	elseif(build_type STREQUAL "dynamiclib")
	elseif(build_type STREQUAL "exec")
		if(WIN32_EXECUTABLE)
		else()
		endif()
	elseif(build_type STREQUAL "header")
	endif()

	set(QUCIK_BUILD_TYPE "${build_type}")

	if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
		message( "Linux")
	elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
		include("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/os/windows.cmake")
		quick_add_win_post_config()
	else()
		message( FATAL_ERROR "Unsuported OS \"${CMAKE_SYSTEM_NAME}\"")
	endif()

	if(GNU)
	elseif(Clang)
	elseif(MSVC)
	else()
		message( FATAL_ERROR "Compiler \"${CMAKE_CXX_COMPILER_ID}\"not supported")
	endif()

	add_compile_definitions(NOMINMAX)

endfunction()
