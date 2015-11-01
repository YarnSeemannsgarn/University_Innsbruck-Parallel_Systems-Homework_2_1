CC=gcc
FORTRAN=gfortran
CFLAGS=-c -Wall
SOURCES=cache_misses_row_wise.c cache_misses_column_wise.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLES=cache_misses_row_wise cache_misses_column_wise cache_misses_row_wise_fortran cache_misses_column_wise_fortran

all: $(EXECUTABLES)

cache_misses_row_wise: $(OBJECTS)
	$(CC) cache_misses_row_wise.o common.h -o $@

cache_misses_column_wise: $(OBJECTS)
	$(CC) cache_misses_column_wise.o common.h -o $@

cache_misses_row_wise_fortran:
	$(FORTRAN) cache_misses_row_wise.f95 -o $@

cache_misses_column_wise_fortran:
	$(FORTRAN) cache_misses_column_wise.f95 -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(EXECUTABLES) $(OBJECTS) 
