include_guard(GLOBAL)
cmake_minimum_required(VERSION 4.2.3)

function(quick_add_win_post_config)
	target_compile_definitions(${PROJECT_NAME} PRIVATE VC_EXTRALEAN)
	target_compile_definitions(${PROJECT_NAME} PRIVATE WIN32_LEAN_AND_MEAN)
	target_compile_definitions(${PROJECT_NAME} PRIVATE _CRT_SECURE_NO_WARNINGS)
	target_compile_definitions(${PROJECT_NAME} PRIVATE _HAS_EXCEPTIONS=0)
endfunction()
