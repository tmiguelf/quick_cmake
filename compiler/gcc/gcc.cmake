include_guard(GLOBAL)
cmake_minimum_required(VERSION 4.2.3)

function(quick_add_gcc_post_config)
	if(CMAKE_BUILD_TYPE STREQUAL "Debug")
		target_compile_options(${PROJECT_NAME} PRIVATE "-g" "-O0")
		target_compile_options(${PROJECT_NAME} PRIVATE "-fsanitize=address,thread,memory,safe-stack")
	else()
		target_compile_options(${PROJECT_NAME} PRIVATE "-O3" "-foptimize-sibling-calls" "-fstrength-reduce" "-fexpensive-optimizations" )
		target_compile_options(${PROJECT_NAME} PRIVATE "-Wno-deprecated-declarations")
		target_compile_options(${PROJECT_NAME} PRIVATE "-flto=auto")
		target_link_options(${PROJECT_NAME} PRIVATE "-flto" "-O2")
	endif()


	if((CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64") OR (CMAKE_SYSTEM_PROCESSOR STREQUAL "AMD64"))
		target_compile_options(${PROJECT_NAME} PRIVATE "-mavx2" "-msha" "-maes" "-mpopcnt")
	elseif((CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64") OR (CMAKE_SYSTEM_PROCESSOR STREQUAL "ARM64"))
		target_compile_options(${PROJECT_NAME} PRIVATE "-march=armv8.1-a")
	endif()

	target_compile_options(${PROJECT_NAME} PRIVATE "-fvisibility=hidden")
	target_compile_options(${PROJECT_NAME} PRIVATE "-pedantic-errors" "-Wall" "-W" "-Wcast-qual" "-Wshadow" "-Wold-style-cast" )
	target_compile_options(${PROJECT_NAME} PRIVATE "-fno-enforce-eh-specs" "-fno-exceptions" "-fno-rtti")
	target_compile_options(${PROJECT_NAME} PRIVATE "-fmerge-constants" "-fmerge-all-constants")
	target_compile_options(${PROJECT_NAME} PRIVATE "-fno-math-errno")
	#target_compile_options(${PROJECT_NAME} PRIVATE "-ffast-math")
	target_link_options(${PROJECT_NAME} PRIVATE "-fPIC" "-Wl,-rpath=$ORIGIN" "-Wl,-z,stack-size=67108864" )

endfunction()


