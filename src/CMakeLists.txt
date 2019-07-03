add_library(benchmark_tools STATIC tools.F90)
target_include_directories(benchmark_tools PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

add_subdirectory(math)
add_subdirectory(test)
