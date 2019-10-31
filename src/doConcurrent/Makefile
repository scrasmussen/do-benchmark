n=1000
m=1000
l=1000

FC=ftn
FOPTS=-DNINPUT=$(n) -DMINPUT=$(m) -DLINPUT=${l} -DOUTPUT
FOPTS=-DNINPUT=$(n) -DMINPUT=$(m) -DLINPUT=${l} -hthread_do_concurrent -homp -O3
FOPTS=-DNINPUT=$(n) -DMINPUT=$(m) -DLINPUT=${l} -O3 -fPIC -rm -DOUTPUT
FOPTS=-DNINPUT=$(n) -DMINPUT=$(m) -DLINPUT=${l} -O3 -fPIC -rm -hthread_do_concurrent
# -hthread_do_concurrent -hconcurrent -ro -eS
# --cray-print-opts=all  , a command line showme

# FC=pat_build
# FOPTS=-DNINPUT=$(n) -DMINPUT=$(m) -DLINPUT=${l} -u -g mpi
file=dc3


all: build

build:
	$(FC) $(file).F90 -o $(file).exe $(FOPTS)

less:
	less $(file).lst

POPTS=-u -g mpi
POPTS=
perf:
	pat_build $(file).exe $(POPTS)

test:
	./$(file).exe

clean:
	rm -f *~ *.o *.mod *.exe *.exe+pat a.out core *.s *.lst
