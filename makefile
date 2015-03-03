# Set compiler to g++.
CC=g++
LINK=g++
# Set options for the compiler
INC=-I/mnt/home_cr/coughlan/lofar_software/lofar-install/include/ -I/mnt/home_cr/coughlan/lofar_software/lofar-install/include/casacore -I/./include
OPTS=-c -O3
LIB_PATHS=-L/home/coughlan/lofar_software/lofar-install/lib64/ -L/home/coughlan/lofar_software/lofar-install/lib/
LIBS=-lparmdb -lcommon -lblob -llmwcommon -lbfd -llog4cplus -lpthread -lcasa_casa -lcasa_tables -lhdf5 -lm -ldl -lreadline -lncurses -Wl -lmpi -lmpi_cxx

all: build link

build:
	${CC} ${INC} ${OPTS} parmexportcal_plus_clock.cc
link:
	${LINK} -W -Wall -Woverloaded-virtual -Wno-unknown-pragmas -fopenmp -pthread -g -O3  parmexportcal_plus_clock.o  -o parmexportcal_plus_clock -rdynamic ${LIB_PATHS} ${LIBS}
clean:
	rm parmexportcal_plus_clock.o parmexportcal_plus_clock
