# tests2d
fortran benchmark - tests various things of interest to scientific computing

Emphasis is on things commonly used in computational electromagnetics.

1) Compiler ability to optimize double precision vector computations (DAXPY/ZAXPY/ZDOTU/DDOT)
2) DP and complex DP matrix-vector and matrix-matrix operations
3) synchronous and asynchronous disk I/O
4) various built-in DP trig and log functions
5) the ability to optimize a simple DP Hankel function
6) the ability to optimize a simple DP FFT
7) and finally, a compiled DP WHETSTONE test (just for fun :)

The vector, matrix, and I/O tests are run for various length (sizes) to evaluate the compiler's
ability to utilize the hardware caches and/or vector registers. Use the parameters prompted
for at the start of the program to estimate how fast you think the machine is. These tests can
take a long time to run. So, choose wisely!

There is a vector of bools initialized to all .true.; you can use this to turn off tests that
you are not interested in.

Some of the code has been purposely written to attempt to confuse an optimizing compiler. A 
good compiler should be smart enough to catch these. 

Minimal checks are made to determine computational correctness. So take great care when you
move the code to a new machine. Be careful not to over-flow any short integers in the do loop
counters. The code appears to run correctly on the gfortran family of compilers and has run
(in the past) on Cray, Floating Point System (Portland Group), Microsoft, Compaq, Control Data
(ftn), VAX, and a host of others that I can't even remember any more... Sections of the code
have also been compiled using CUDA.

Have fun,
-John
