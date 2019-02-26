add_library(benchmark_math SHARED matrix_product.F90 saxpy.F90)
target_include_directories(benchmark_math PUBLIC ${CMAKE_CURRENT_BINARY_DIR})
