add_exectutable (saxpy.exe saxpy_test.F90)
target_link_libraries(saxpy.exe PRIVATE do_benchmark_math)
