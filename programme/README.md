How to run the programme/s
==========================

First of all build all programmes:

    $ make
    
Afterwards you can run the programmes (e.g. cache_misses_row_wise) as follows:

    $ ./cache_misses_row_wise <problem-size>
    
    
If you want to clean up just do:

    $ make clean

Task 1, 2 & 3
=============

Host machine: 4 CPUs (per cpu: 4 cores, 800Mhz, cache size: 512KB, cache alignment: 64)
getconf -a | grep CACHE output:

LEVEL1_ICACHE_SIZE                 65536
LEVEL1_ICACHE_ASSOC                2
LEVEL1_ICACHE_LINESIZE             64
LEVEL1_DCACHE_SIZE                 65536
LEVEL1_DCACHE_ASSOC                2
LEVEL1_DCACHE_LINESIZE             64
LEVEL2_CACHE_SIZE                  524288
LEVEL2_CACHE_ASSOC                 16
LEVEL2_CACHE_LINESIZE              64
LEVEL3_CACHE_SIZE                  6291456
LEVEL3_CACHE_ASSOC                 48
LEVEL3_CACHE_LINESIZE              64
LEVEL4_CACHE_SIZE                  0
LEVEL4_CACHE_ASSOC                 0
LEVEL4_CACHE_LINESIZE              0

Programme                        | Problem size | Runtime (in s) | cache misses
:--------------------------------|-------------:|---------------:|-------------------------------------------------------:
cache_misses_row_wise            | 2048x2048    | 0.08           | I1 misses: 1015, D1 misses:  265912, LL misses:  266191
cache_misses_column_wise         | 2048x2048    | 0.23           | I1 misses: 1015, D1 misses: 4202048, LL misses: 4202395
cache_misses_row_wise_fortran    | 2048x2048    | 0.17           | I1 misses: 1681, D1 misses: 4199478, LL misses: 4200041
cache_misses_column_wise_fortran | 2048x2048    | 0.08           | I1 misses: 1679, D1 misses:  267318, LL misses:  267882


The execution times obviously depend on the cache misses. The more misses there are, the longer the programme runs, because it has to load the data from main memory.

In C the row-wise version has the smaller execution time, in Fortran the colum version is faster. This is due to the different methods for arranging multidimensional arrays in linear storage (like memory). C has row-major order, where consecutive elements of the rows of the array are contiguous in memory. Fortran has column-major order, where consecutive elements of the columns are contiguous.

The difference between the column-wise C-version and the row-wise Fortran-version is due to different compilers and measurement details and the D1 and LL misses.