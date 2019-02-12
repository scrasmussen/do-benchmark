GNU=
INTEL=
TAU=1
##     define GNU
ifdef INTEL
FC=ifort
FFLAGS=-qopenmp -O3 -profile-functions
endif
ifdef GNU
FC=gfortran
FFLAGS=-fopenmp -g -O3
endif
ifdef TAU
FC=tau_f90.sh
FFLAGS='-fopenmp -g -O3 -opt'
endif

FILE=saxpy.F90
FILE=saxpy_omp.F90
SRC=$(wildcard *.F90)
OBJS=$(SRC:.F90=.o)
TESTS=do_1.exe

# ifeq ($(FILE),saxpy.F90)
FFLAGS+= -DSETN=10 -DSETRUN=1
# endif

%.o : %.F90
	$(FC) $(FFLAGS) -o $(basename $@).exe $<

# all: awk
all: build

# build: $(OBJS)
# 	@echo "fin build"

build:
	export TAU_OPTIONS='-optNoMPI -optContinueBeforeOMP'
	export TAU_MAKEFILE=/apps/software/TAU/2.27-foss-2018a/x86_64/lib/Makefile.tau-papi-pdt-openmp-opari
	export OMP_NUM_THREADS=4
	$(FC) $(FFLAGS) $(FILE) -o $(basename $(FILE)).exe $<

# run:
# 	@echo $(SRC)
# 	@echo "======"
# 	$(foreach f, $(SRC), ./$(basename $(f)).exe)
# 	@echo "fin run"

awk:
	./extractInfo.awk

clean:
	rm -f *~ *.o *.exe rose*.F90 a.out *.pomp.* profile.* *.inst.* *.pp.* *.pdb *.opari.* *.continue.* *.mod

cleantxt: clean
	rm -f *.txt
