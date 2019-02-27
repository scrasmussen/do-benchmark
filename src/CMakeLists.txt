add_library(benchmark_tools SHARED tools.F90)
target_link_libraries(benchmark_tools PUBLIC benchmark_math)
target_include_directories(benchmark_tools PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

add_subdirectory(math)
add_subdirectory(test)
