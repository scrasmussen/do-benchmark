cmake_minimum_required(VERSION 3.13)
project(do-benchmark Fortran)

add_subdirectory(src)

# find_package(TAU OR SOMETHING)
# configure_file(... COPYONLY)

# ARTLESS TODO: make sure this is correct, how to update?
# set Fortran_FLAGS
set(CMAKE_Fortran_FLAGS "-g -03")
target_compile_definitions(saxpy.exe PRIVATE SETN=100 SETLOOP=1)
# target_compile_definitions(saxpy.exe PRIVATE SETN=100 SETLOOP=1)
# add_compile_definitions(-DSETN=100 -DSETLOOP=1)
