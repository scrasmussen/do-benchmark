n=10
m=10
l=10

FC=ftn
FOPTS=-DNINPUT=$(n) -DMINPUT=$(m) -DLINPUT=${l} -DOUTPUT
FOPTS=-DNINPUT=$(n) -DMINPUT=$(m) -DLINPUT=${l}
file=dc3


all: build

build:
	$(FC) $(file).F90 -o $(file).exe $(FOPTS)

test:
	./$(file).exe

clean:
	rm -f *~ *.o *.mod *.exe a.out core
