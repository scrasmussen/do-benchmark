FC=gfortran
FC=ifort
FILE=doconcurrent_2.f90

SRC=$(wildcard *.f90)
OBJS=$(SRC:.f90=.o)

%.o : %.f90
	$(FC) $(FFLAGS) -o $(basename $@).exe $<

all: build

build: $(OBJS)
	echo "fin"

clean:
	rm -f *~ *.o *.exe rose*.f90 a.out
