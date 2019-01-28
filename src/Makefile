FC=gfortran
FC=ifort
FC=tau_f90.sh

FILE=saxpy.f90
SRC=$(wildcard *.f90)
OBJS=$(SRC:.f90=.o)
TESTS=do_1.exe

%.o : %.f90
	$(FC) $(FFLAGS) -o $(basename $@).exe $<

all: build

# build: $(OBJS)
# 	@echo "fin build"

build:
	$(FC) $(FFLAGS) $(FILE) -o $(basename $(FILE)).exe $<

# run:
# 	@echo $(SRC)
# 	@echo "======"
# 	$(foreach f, $(SRC), ./$(basename $(f)).exe)
# 	@echo "fin run"

clean:
	rm -f *~ *.o *.exe rose*.f90 a.out *.pomp.* profile.*
