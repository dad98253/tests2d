﻿Be very wary of published whetstone results. There are many variations of the test in the wild, 
 and every modern one that I have come across has had issues. The only reliable source that I have 
 found are the original fortran routines. These can still be found online (FOPR12 and FOPR13) and 
 they closely match what was published in the original paper (“A synthetic benchmark” ,H J Curnow 
 and B A Wichmann, Computer Journal, Vol 19, No 1, pp43-49. 1976) (included as whetstone.pdf). I 
 have seen published numbers from later codes that are wrong by more than an order of magnitude!

The common problems that I have seen in these later versions are : 
1) Additional loops will be added or lengthened in the wrong places which cause numerical underflow
problems. This is an issue because such numerical problems will cause calculations to interrupt, 
invalidating the pipeline on vector machines, and will add significant cpu time to the calculation. 
Instead of adding inner loops, run the whole code in a big outer loop. That way, each loop will be 
properly initialized and you should be able to duplicate the numerical results that the authors 
obtained (yes, print the output: it’s there to help you). Don’t mess with the variable “I”. It was 
small in the early days. A good “standard” value for the whetstone test is 100.
2) Mixing short integers with double precision floats in common blocks (if not done properly) can 
often cause memory alignment issues with the shorter words. This can slow you down as well. An easy 
solution is to just make all of them integer*8 (any compiler worth its salt will support this fortran 
extension) using an implicit statement. Most modern computers can perform scalar operations on 
integer*8 as fast as they can on integer*4.
3) I’ve seen a lot of whetstone versions where the calculation in the P3 subroutine is changed in such
a way that X and Y are both input and output. In the original code, they are input only. Making them 
in/out can impact optimization and significantly slow down the code.

I have included some additional versions of the whetstone test for your enjoyment. I modified these 
to try to make them as accurate as I know how. If you plan to publish some whetstone results, I 
suggest that you play with each of these and verify that you can get reasonable results. If one is 
running significantly faster or slower than another, you likely have a problem somewhere… I am also 
including a short table illustrating their timings on my desktop computer. Usually, the whetstone will
run pretty close to scalar cpu speed and scalar cpu speed tends to track reasonably well with cpu clock
speed (particularly for cpus in the same family). So, a good first check would be to compare your 
results to what I got on my computer, scaled by our relative clock speeds.

As always, have fun. If you’re not having fun, then you’re doing something wrong :)
