# tests2d
fortran benchmark - tests various things of interest to scientific computing

The purpose of the benchmark is to gain a detailed understanding of the performance of the compiler
and hardware in order to effect fine tuning of large number crunching codes. Emphasis is on things
commonly used in computational electromagnetics.

1) Compiler ability to optimize double precision vector computations (DAXPY/ZAXPY/ZDOTU/DDOT)
2) DP and complex DP matrix-vector and matrix-matrix operations
3) synchronous and asynchronous disk I/O
4) various built-in DP trig and log functions
5) the ability to optimize a simple DP Hankel function
6) the ability to optimize a simple DP FFT
7) and finally, a compiled DP WHETSTONE test (just for fun :) (Hey, managers love Whets!)

The vector, matrix, and I/O tests are run for various length (sizes) and strides to evaluate
the compiler's ability to utilize the hardware caches and/or vector registers. Use the parameters
prompted for at the start of the program to estimate how fast you think the machine is. These 
tests can take a long time to run. So, choose wisely! If your guess is accurate, it will equate
to about a ten second test loop. Ideally, the code uses wall time, so you'll probably want each 
loop to run this long to get a reasonably accurate (~1.5 digits??) result. However, I got lazy in
my old age and switched to using the fortran cpu_time routine. Trig function loop sizes are a
swag, so check your output for how long these loops run.

The code probably won't auto-parallelize. However, some of the loops are written in such a way
that they are performing identical operations in each outer pass. So, a really smart compiler
should be able to detect this and short circuit the additional loops. I'm still waiting for that
compiler... Of course, many of the routines vectorize nicely.

There is a vector of bools initialized to all .true. near the top of the code; you can use this
to turn off tests that you are not interested in.

Some of the scalar code has been purposely written to attempt to confuse an optimizing compiler. A 
good compiler should be smart enough to catch these. 

Minimal checks are made to determine computational correctness. For example, the code does not even
attempt to verify that the asynchronous I/O is actually asynchronous (many machines just pretend!).
Take great care when you move the code to a new machine. I.e., watch that you don’t overflow any
short integers in the do loop counters, keep an eye on memory alignment, and don't publish until
you're sure that you understand your results.

You will probably see some "ieee_inexact is signaling" warnings (if your compiler supports them).
These are inherent to the whetstone and can be ignored. See the additional readme file regarding
whetstone testing.

The code appears to run correctly on the gfortran and flang family of compilers and has run (in the
past) on Cray, Floating Point Systems, Intel iPSC/860 (Portland Group), Convex, BBN, Microsoft,
Compaq, Control Data (ftn), VAX VMS, and a host of others that I can't even remember any more...

Have fun,
-John
