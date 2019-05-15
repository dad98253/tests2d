# tests2d
fortran benchmark - tests various things of interest to scientific computing

Emphasis is on things commonly used in computational electromagnetics.

1) Compiler ability to optimize double precision vector computations (DAXPY/ZAXPY/ZDOTU/DDOT)
2) DP and complex DP matrix-vector and matrix-matrix operations
3) synchronous and asynchronous disk I/O
4) various built-in DP trig and log functions
5) the ability to optimize a simple DP Hankle function
6) the ability to optimize a simple DP FFT
7) and finally, a compiled DP WHETSTONE test (just for fun :)
