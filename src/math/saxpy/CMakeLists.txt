# add_library(benchmark_saxpy SHARED saxpy.F90 saxpy_omp.F90 saxpy_openacc.F90)
add_library(benchmark_saxpy STATIC saxpy.F90 saxpy_omp.F90 saxpy_openacc.F90)
target_include_directories(benchmark_saxpy PUBLIC ${CMAKE_CURRENT_BINARY_DIR})
