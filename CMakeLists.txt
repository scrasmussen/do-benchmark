cmake_minimum_required(VERSION 3.13)
project(do-benchmark Fortran)

add_subdirectory(src)

# Set the up time to iterate
set(N 100)
set(LOOP 1)
set(CMAKE_Fortran_FLAGS "-g -03")
target_compile_definitions(saxpy.exe        PRIVATE SETN=${N} SETLOOP=${LOOP})
target_compile_definitions(saxpyOMP.exe     PRIVATE SETN=${N} SETLOOP=${LOOP})
target_compile_definitions(saxpyOpenACC.exe PRIVATE SETN=${N} SETLOOP=${LOOP})
