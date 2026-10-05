include_guard(GLOBAL)
cmake_minimum_required(VERSION 4.2.3)

function(quick_add_msvc_post_config)
	if(CMAKE_BUILD_TYPE STREQUAL "Debug")
		target_compile_options(${PROJECT_NAME} PRIVATE "/Od" )
		target_compile_options(${PROJECT_NAME} PRIVATE "/GS" "/RTC1" "/Zi")
		
		#target_link_options(${PROJECT_NAME} PRIVATE "/INFERASANLIBS")
	
	else()
		target_compile_options(${PROJECT_NAME} PRIVATE "/O2" "/Ot" "/GL" "/GR-" "/Gw" "/Zo")
		#target_compile_options(${PROJECT_NAME} PRIVATE "/Gu-")
		target_compile_options(${PROJECT_NAME} PRIVATE "/WX" "/wd4996")

		target_link_options(${PROJECT_NAME} PRIVATE "/LTCG" "/DYNAMICBASE")
		#target_link_options(${PROJECT_NAME} PRIVATE "/OPT:REF,ICF") #default

		if(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
			target_link_options(${PROJECT_NAME} PRIVATE "/DYNAMICDEOPT")
		endif()
	endif()

	if((CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64") OR (CMAKE_SYSTEM_PROCESSOR STREQUAL "AMD64"))
		target_compile_options(${PROJECT_NAME} PRIVATE "/arch:AVX2")
	#	target_compile_options(${PROJECT_NAME} PRIVATE "/feature:APX")
	elseif((CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64") OR (CMAKE_SYSTEM_PROCESSOR STREQUAL "ARM64"))
		target_compile_options(${PROJECT_NAME} PRIVATE "/arch:armv9.0")
	#	target_compile_options(${PROJECT_NAME} PRIVATE "/feature:cssc")
	#	target_compile_options(${PROJECT_NAME} PRIVATE "/feature:faminmax")
	#	target_compile_options(${PROJECT_NAME} PRIVATE "/feature:lse")
	#	target_compile_options(${PROJECT_NAME} PRIVATE "/feature:rcpc")
	#	target_compile_options(${PROJECT_NAME} PRIVATE "/feature:rcpc2")
	#	target_link_options(${PROJECT_NAME} PRIVATE "/OPT:LBR")

	endif()


	target_compile_options(${PROJECT_NAME} PRIVATE "/permissive-" "/Zc:enumTypes" "/Zc:templateScope" "/Zc:strictStrings" "/Zc:preprocessor" "/Zc:__cplusplus" "/Zc:rvalueCast")
	target_compile_options(${PROJECT_NAME} PRIVATE "/EHa-")
	#target_compile_options(${PROJECT_NAME} PRIVATE "/EHr-")
	target_compile_options(${PROJECT_NAME} PRIVATE "/EHs-")
	target_compile_options(${PROJECT_NAME} PRIVATE "/fp:fast" "/volatile:iso")
	target_compile_options(${PROJECT_NAME} PRIVATE "/W4" "/sdl")
	target_compile_options(${PROJECT_NAME} PRIVATE "/bigobj")
	target_compile_options(${PROJECT_NAME} PRIVATE "/utf-8" "/validate-charset")
	target_compile_options(${PROJECT_NAME} PRIVATE "/nologo")

	target_link_options(${PROJECT_NAME} PRIVATE "/NOLOGO")
	target_link_options(${PROJECT_NAME} PRIVATE "/STACK:67108864" "/WX")
	target_link_options(${PROJECT_NAME} PRIVATE "/NXCOMPAT")
endfunction()
