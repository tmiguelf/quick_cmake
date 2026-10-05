include_guard(GLOBAL)
cmake_minimum_required(VERSION 4.2.3)

function(quick_add_clang_post_config)

	if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
		if(CMAKE_BUILD_TYPE STREQUAL "Debug")
			target_compile_options(${PROJECT_NAME} PRIVATE "-g" "-O0")
		else()
			target_compile_options(${PROJECT_NAME} PRIVATE "-O3" "-foptimize-sibling-calls" )
			target_compile_options(${PROJECT_NAME} PRIVATE "-Wno-deprecated-declarations")
			target_compile_options(${PROJECT_NAME} PRIVATE "-flto=auto")
			target_link_options(${PROJECT_NAME} PRIVATE "-flto")
		endif()

		if((CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64") OR (CMAKE_SYSTEM_PROCESSOR STREQUAL "AMD64"))
			target_compile_options(${PROJECT_NAME} PRIVATE "-mavx2" "-msha" "-maes" "-mpopcnt")
		elseif((CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64") OR (CMAKE_SYSTEM_PROCESSOR STREQUAL "ARM64"))
			target_compile_options(${PROJECT_NAME} PRIVATE "-march=armv8.1-a")
		endif()

		target_compile_options(${PROJECT_NAME} PRIVATE "-fvisibility=hidden")
		target_compile_options(${PROJECT_NAME} PRIVATE "-pedantic-errors" "-Weverything" "-Wall" "-W" "-Werror" "-Wcast-qual" "-Wshadow" "-Wold-style-cast" "-Winline" "-Wno-c++98-compat")
		target_compile_options(${PROJECT_NAME} PRIVATE "-fno-exceptions" "-fno-rtti")
		target_compile_options(${PROJECT_NAME} PRIVATE "-fmerge-all-constants")
		target_compile_options(${PROJECT_NAME} PRIVATE "-ffast-math" "-fno-math-errno")

		target_link_options(${PROJECT_NAME} PRIVATE "-fPIC")
	else()

		if(CMAKE_BUILD_TYPE STREQUAL "Debug")
			target_compile_options(${PROJECT_NAME} PRIVATE "/Od" )
			target_compile_options(${PROJECT_NAME} PRIVATE "/GS" "/RTC1" "/Zi")
	
		else()
			target_compile_options(${PROJECT_NAME} PRIVATE "/O2" "/Ot" "/GR-" "/Gw" "/Zo")
			target_compile_options(${PROJECT_NAME} PRIVATE "/WX")
			#target_link_options(${PROJECT_NAME} PRIVATE "-flto")
		endif()

		if((CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64") OR (CMAKE_SYSTEM_PROCESSOR STREQUAL "AMD64"))
			target_compile_options(${PROJECT_NAME} PRIVATE "/arch:AVX2")
		elseif((CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64") OR (CMAKE_SYSTEM_PROCESSOR STREQUAL "ARM64"))
			target_compile_options(${PROJECT_NAME} PRIVATE "/arch:armv8.0")
		endif()

		target_compile_options(${PROJECT_NAME} PRIVATE "/permissive-" "/Zc:strictStrings" "/Zc:__cplusplus" "/Zc:rvalueCast")
		target_compile_options(${PROJECT_NAME} PRIVATE "/EHa-")
		target_compile_options(${PROJECT_NAME} PRIVATE "/EHs-")
		target_compile_options(${PROJECT_NAME} PRIVATE "/fp:fast" "/volatile:iso")
		target_compile_options(${PROJECT_NAME} PRIVATE "/W4" "/sdl")
		target_compile_options(${PROJECT_NAME} PRIVATE "/bigobj")
		target_compile_options(${PROJECT_NAME} PRIVATE "/utf-8" "/validate-charset")
		target_compile_options(${PROJECT_NAME} PRIVATE "/nologo")

		target_link_options(${PROJECT_NAME} PRIVATE "/STACK:67108864" "/WX")
		target_link_options(${PROJECT_NAME} PRIVATE "/NXCOMPAT")


	endif()
endfunction()
