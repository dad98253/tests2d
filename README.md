# tests2d
fortran benchmark - tests various things of interest to scientific computing

Emphasis is on things commonly used in computational electromagnetics.

1) Compiler ability to optimize double precision vector computations (DAXPY/ZAXPY/ZDOTU/DDOT)
2) DP and complex DP matrix-vector and matrix-matrix operations
3) synchronous and asynchronous disk I/O
4) various built-in DP trig and log functions
5) the ability to optimize a simple DP Hankel function
6) the ability to optimize a simple DP FFT
7) and finally, a compiled DP WHETSTONE test (just for fun :) (Hey, managers love Whets!)

The vector, matrix, and I/O tests are run for various length (sizes) to evaluate the compiler's
ability to utilize the hardware caches and/or vector registers. Use the parameters prompted
for at the start of the program to estimate how fast you think the machine is. These tests can
take a long time to run. So, choose wisely! If your guess is accurate, it will equate to about
a ten second test loop. The code uses wall time, so you'll probably want each loop to run this
long to get a reasonably accurate (~1.5 digits??) result. Trig function loop sizes are a swag,
so check your output for how long these loops run.

The code probably won't auto-parallelize. However, some of the loops are written in such a way
that they are performing identical operations in each outer pass. So, a really smart compiler
should be able to detect this and short cicuit the additional loops. I'm still waiting for that
compiler...

There is a vector of bools initialized to all .true. near the top of the code; you can use this
to turn off tests that you are not interested in.

Some of the scalar code has been purposely written to attempt to confuse an optimizing compiler. A 
good compiler should be smart enough to catch these. 

Minimal checks are made to determine computational correctness. For example, the code does not
attempt to verify that the asynchronous I/O is actually asynchronous (many machines just pretend!).
So take great care when you move the code to a new machine. I.e., be careful not to overflow any
short integers in the do loop counters and don't publish until you're sure you understand your results.

The code appears to run correctly on the gfortran family of compilers and has run (in the past) on
Cray, Floating Point System (Portland Group), Microsoft, Compaq, Control Data (ftn), VAX VMS, and a host
of others that I can't even remember any more... Sections of the code have also been compiled using CUDA.

Have fun,
-John
