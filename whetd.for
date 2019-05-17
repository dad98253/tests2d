C  Document:         Whetd.for 
C  File Group:       Classic Benchmarks
C  Creation Date:    11 December 1996
C  Revision Date:    
C
C  Title:            Whetstone Benchmark Double Precision Fortran
C  Keywords:         WHETSTONE BENCHMARK PERFORMANCE MIPS
C                    MWIPS MFLOPS
C
C  Abstract:         Fortran version of Whetstone one of the
C                    Classic Numeric Benchmarks with example
C                    results on P3 to P6 based PCs.        
C
C  Contributor:      Roy Longbottom 101323.2241@compuserve.com
C                         or     Roy_Longbottom@compuserve.com
C
C ***********************************************************
C         FORTRAN WHETSTONE BENCHMARK DOUBLE PRECISION
C
C      Original concept              Brian Wichmann NPL  1960s
C      Original author               Harold Curnow  CCTA 1972
C      Self timing version           Roy Longbottom CCTA 1978
C      Detailed timing version       Roy Longbottom CCTA 1987
C      Over optimisation avoidance   Bangor University   1987
C      This version                  Roy Longbottom      1996
C
C ************************************************************
C
C              Official version approved by:
C
C         Harold Curnow  100421.1615@compuserve.com
C
C      Happy 25th birthday Whetstone, 21 November 1997
C
C ***********************************************************
C  
C      The progam should run for about 100 seconds on PCs
C      (adustable variable TIMEIN). This time is necessary
C      because of the poor clock resolution. The original
C      concept included such things as a given number of
C      subroutine calls and divides which may be changed by
C      optimisation. For comparison purposes the level of
C      optimisation should be identified. COMPIL and OPTNS
C      variables should be used for this purpose.
C         
C ************************************************************
C
C     The original benchmark had a single variable I which
C     controlled the running time. Constants with values up
C     to 899 were multiplied by I to control the number
C     passes for each loop. It was found that large values
C     of I could overflow index registers so an extra outer
C     loop with a second variable J was added.
C
C     Self timing versions were produced during the early
C     days. The 1978 changes supplied timings of individual
C     loops and these were used later to produce MFLOPS and
C     MOPS ratings.
C
C     1987 changes converted the benchmark to Fortran 77
C     standards and removed redundant IF statements and
C     loops to leave the 8 active loops N1 to N8. Procedure
C     P3 was changed to use global variables to avoid over-
C     optimisation with the first two statements changed from
C     X1=X and Y1=Y to X=Y and Y=Z. A self time calibrating
C     version for PCs was also produced, the facility being
C     incorporated in this version.
C
C     This version has changes to avoid worse than expected
C     speed ratings, due to underflow, and facilities to show
C     that consistent numeric output is produced with varying
C     optimisation levels or versions in different languages.
C
C     Some of the procedures produce ever decreasing numbers.
C     To avoid problems, variables T and T1 have been changed
C     from 0.499975 and 0.50025 to 0.49999975 and 0.50000025.
C
C     Each section now has its own double loop. Inner loops
C     are run 100 times the loop constants. Calibration
C     determines the number of outer loop passes. The
C     numeric results produced in the main output are for
C     one pass on the outer loop. As underflow problems were
C     still likely on a processor 100 times faster than a 100
C     MHZ Pentium, three sections have T=1.0-T inserted in the
C     outer loop to avoid the problem. The two loops avoid
C     index register overflows.
C
C     The first section is run ten times longer than required
C     for accuracy in calculating MFLOPS. This time is divided
C     by ten for inclusion in the MWIPS calculations.
C
C     This version has facilities for typing in details of the
C     particular run. This information is appended to file
C     Whets.txt along with the results. Note that typing on
C     the same line as an output prompt and appending to a file
C     use Microsoft extensions. The ANSI alternative has input
C     on the next line (label 136) and writes a complete new
C     output file for each run, overwriting an existing output
C     file (see OPEN at line 250 approximately).
C
C
C     Roy Longbottom  101323.2241@compuserve.com
C
C***********************************************************
C
C     Whetstone benchmark results are available in whets.tbl
C     from ftp.nosc.mil/pub/aburto. The results include
C     further details of the benchmarks.
C
C***********************************************************
C
C     Source code is available in C++, C, Fortran, Basic and
C     Visual Basic in the same format as this version. Pre-
C     compiled versions for PCs are also available via C++.
C     These comprise optimised and non-optimised versions
C     for DOS, Windows and NT.
C
C ************************************************************
C
C           Examples of Results
C
C Double Precision  Fortran Whetstone Benchmark
C
C Month run         4/1996
C PC model          Escom
C CPU               Pentium
C Clock MHz         100
C Cache             256K
C Options           Neptune chipset
C OS/DOS            Windows 95
C Compiler          MS Fortran 5.1                        
C Options           DOS.exe F77 I/L80287 no opt           
C Run by            Roy Longbottom
C From              UK
C Mail              101323.2241@compuserve.com 
C
C Loop content                Result           MFLOPS      MOPS   Seconds
C
C N1 floating point   -1.12398255667393100     10.424                .291
C N2 floating point   -1.12187079889296000      7.447               2.852
C N3 if then else      1.00000000000000000                3.768     4.340
C N4 fixed point      12.00000000000000000                3.259    15.270
C N5 sin,cos etc.       .49902906979403630                1.054    12.469
C N6 floating point     .99999987890802670      2.647              32.191
C N7 assignments       3.00000000000000000                1.490    19.598
C N8 exp,sqrt etc.      .75100163018458310                 .491    11.980
C
C MWIPS                                        15.961              98.990
C
C Double Precision  Fortran Whetstone Benchmark
C
C Month run         4/1996
C PC Supplier/model Escom                                 
C CPU chip type     Pentium                               
C Clock MHz         100                                   
C Cache size        256K                                  
C Chipset/options   Neptune chipset                               
C OS/DOS            Win 95 Dos                            
C Compiler          MS Fortran 5.1                        
C Options           DOS.exe F77 I/L80287 time and loop opt
C Run by            Roy Longbottom                        
C From              UK                                    
C Mail address      101323.2241@compuserve.com                    
C
C Loop content                Result           MFLOPS      MOPS   Seconds
C
C N1 floating point   -1.12398255667393000     19.661                .170
C N2 floating point   -1.12187079889295900     11.190               2.090
C N3 if then else      1.00000000000000000                4.973     3.621
C N4 fixed point      12.00000000000000000                3.752    14.609
C N5 sin,cos etc.       .49902906979403770                1.075    13.461
C N6 floating point     .99999987890802700      2.657              35.320
C N7 assignments       3.00000000000000000                1.940    16.578
C N8 exp,sqrt etc.      .75100163018458130                 .495    13.082
C
C MWIPS                                        17.588              98.932
C
C  Note different numeric values between the results. Slight variations
C  are normal with different compilers and sometimes optimisation levels. 
C
C *************************************************************************
C
C       Example results MS Fortran 5.1 DOS.exe F77 I/L80287
C
C  Note that this is not a very good compiler. 32 bit Fortran compilers
C  should obtain much faster speeds, particularly on the latest technology
C
C
C                 Double Precision Non-optimised Results
C
C     MWIPS   MFLOPS  MFLOPS  MFLOPS  COS     EXP     FIXPT   IF     EQUAL
C Key           1       2       3     MOPS    MOPS    MOPS    MOPS    MOPS
C                                                               
C P3  1.88    0.617   0.572   0.264   0.134   0.064   0.425   0.429   0.220
C P4  5.60    3.32    2.49    0.841   0.322   0.181   1.29    1.68    0.589
C P5  16.0    10.4    7.45    2.65    1.05    0.491   3.26    3.77    1.49
C P6  15.9    6.13    5.60    2.31    1.81    0.900   3.05    4.26    1.21
C
C
C      Double Precision Optimised Results - time and loop optimisation
C                                                               
C     MWIPS   MFLOPS  MFLOPS  MFLOPS  COS     EXP     FIXPT   IF     EQUAL
C Key           1       2       3     MOPS    MOPS    MOPS    MOPS    MOPS
C                                                                                                                                
C P3  2.27    0.808   0.748   0.310   0.141   0.069   0.484   0.753   0.346
C P4  6.13    4.27    3.24    0.950   0.324   0.185   1.32    1.95    0.691
C P5  17.6    19.7    11.2    2.66    1.08    0.495   3.75    4.97    1.94
C P6  22.3    38.7    14.0    2.81    1.83    0.911   5.09    4.87    2.41
C
C
C                             Systems  
C       
C Key System       CPU     MHz   Cache    Options          OS
C       
C P3  Clone     AM80386DX  40    128K   with 387        Windows 95
C P4  Escom,    80486DX2   66.7  128K   CIS chipset     Windows 95
C P5  Escom,    Pentium   100    256K   Neptune chipset Windows 95
C P6  Dell Pro  PentPro   200    256K   440FX PCIset    NT 3.51
C
C *************************************************************************
C
C                       Running Instructions
C
C      1.  In order to run successfully, include timer option at FUNCTION
C          SECOND. The present option if for PCs but others are available
C          (at end of program).
C      2.  If pre-compiled codes are to be distributed, uncomment the
C          the titles at PRECOMPILE below and insert compiler details.
C      3.  Change file output and text input statements if necessary -
C          see above.
C      4.  Run with maximum and no optimisation (minimum debug)
C      5.  Notify Roy Longbottom of other necessary changes
C      6.  Send results file whets.txt to Roy Longbottom - with one
C          sample of each run and system details fully completed
C
C             Roy Longbottom  101323.2241@compuserve.com 
C
C *************************************************************************

      implicit integer*8 (i-m)
      IMPLICIT DOUBLE PRECISION ( A - H , O - Z )
      DOUBLE PRECISION T,T1,T2,E1,CHECK,RESULT
      COMMON T,T1,T2,E1(4),J,K,L
      COMMON WIPS, CHECK, SECTOT
      COMMON TIMELP(8), OPS(8), FLOPS(8), IJK, RESULT(8)
      COMMON/HEAD/ HEADRS
      COMMON/IO/NOUT
      CHARACTER*18 HEADRS(8)
      CHARACTER COMPIL*38, OPTNS*38
      CHARACTER INWORD*38, OTWORD*18

      NOUT=6
C     ALL OUTPUT TO CHANNEL NOUT

      OPEN (4, FILE = 'Whets.txt', ACCESS = 'APPEND',
     1                           STATUS = 'UNKNOWN', ERR = 200)
C      OPEN (4, FILE = 'Whets.txt', STATUS = 'UNKNOWN', ERR = 200)

C    PRECOMPILE PRECOMPILE PRECOMPILE PRECOMPILE PRECOMPILE PRECOMPILE

      COMPIL = ' '
      OPTNS =  ' '

C      COMPIL = 'INSERT COMPILER NAME HERE'
C      OPTNS =  'INSERT OPTIMISATION OPTIONS HERE'

      SECTOT = 0.0
      CALIB = 1.0
      IX100 = 100
      IXTRA = 1
      TIMEIN = 100.0

      WRITE(NOUT,7)
    7 FORMAT (' Calibrating Whetstone Benchmark')


      DO 100 I=1,10
         IF (SECTOT.LT.2.0) THEN
            SECTOT = 0.0
            
            CALL WHETS(IXTRA, IX100, CALIB)
            WRITE(NOUT,14) SECTOT,IXTRA
   14       FORMAT(F11.2,' Seconds',I6,' Passes (x 100)')
            IF (SECTOT.LT.2.0) THEN
                IXTRA = IXTRA * 5
            ENDIF
            CALIB = CALIB + 1.0
         ENDIF
  100 CONTINUE
      IXTRA = INT(TIMEIN * FLOAT(IXTRA) / SECTOT)
      IF (IXTRA.LT.1) THEN
            IXTRA = 1
      ENDIF
      
      WRITE(NOUT,15) TIMEIN
   15 FORMAT(/' Whetstone Benchmark for ',F7.2, ' seconds duration'/)
      WRITE(NOUT,16) IXTRA
   16 FORMAT(I7,' passes used (x 100)'/)
              
      CALIB = 0.0
      WRITE(NOUT,17)
   17 FORMAT(' Fortran Whetstone Benchmark - Double Precision'/)     
      WRITE(NOUT,19) COMPIL
      WRITE(NOUT,19) OPTNS
   19 FORMAT(1X,A/)
      WRITE(NOUT,22)
   22 FORMAT(' Loop content',19X,'Result',16X,'MFLOPS',
     1       6X,'MOPS',3X,'Seconds'/)
      SECTOT = 0.0
      
      CALL WHETS(IXTRA,IX100,CALIB)
      
      IF (SECTOT.GT.0.0) THEN
         WIPS = FLOAT(IXTRA)*FLOAT(IX100)/(10.0 * SECTOT)
      ELSE
         WIPS = 0.0
      ENDIF

      WRITE(NOUT,24) WIPS,SECTOT
   24 FORMAT(/' MWIPS',45X,F9.3,11X,F9.3/)
      
      IF (CHECK.EQ.0.0) THEN
         WRITE(NOUT,25)
   25    FORMAT(' Wrong answer'/)      
      ENDIF
      if (.true.) stop
      WRITE(NOUT,110)
  110 FORMAT(' Enter datails in the boxes for filing with the results'/)
      WRITE(4,112)
  112 FORMAT ('----------------- ----------------------------- ',
     1      '--------- --------- --------- --------- --------- ',
     2      '--------- --------- --------- ---------')
      WRITE(4,120)
  120 FORMAT ('Double Precision  Fortran Whetstone Benchmark'/)
      OTWORD = 'Date of run '
      WRITE(NOUT,136) OTWORD
      READ(*,140) INWORD
      WRITE(4,133) OTWORD, INWORD      
      OTWORD = 'PC Supplier/model '
      WRITE(NOUT,136) OTWORD
      READ(*,140) INWORD
      WRITE(4,133) OTWORD, INWORD
      OTWORD = 'CPU chip type '
      WRITE(NOUT,136) OTWORD
      READ(*,140) INWORD
      WRITE(4,133) OTWORD, INWORD
      OTWORD = 'Clock MHz '
      WRITE(NOUT,136) OTWORD
      READ(*,140) INWORD
      WRITE(4,133) OTWORD, INWORD
      OTWORD = 'Cache size '
      WRITE(NOUT,136) OTWORD
      READ(*,140) INWORD
      WRITE(4,133) OTWORD, INWORD
      OTWORD = 'Chipset/options '
      WRITE(NOUT,136) OTWORD
      READ(*,140) INWORD
      WRITE(4,133) OTWORD, INWORD
      OTWORD = 'OS/DOS '
      WRITE(NOUT,136) OTWORD
      READ(*,140) INWORD
      WRITE(4,133) OTWORD, INWORD
      OTWORD = 'Compiler '
      IF (COMPIL.EQ.' ') THEN
           WRITE(NOUT,136) OTWORD
           READ(*,140) COMPIL
      ENDIF
      WRITE(4,133) OTWORD, COMPIL
      OTWORD = 'Options  '
      IF (OPTNS.EQ.' ') THEN
           WRITE(NOUT,136) OTWORD
           READ(*,140) OPTNS
      ENDIF
      WRITE(4,133) OTWORD, OPTNS
      OTWORD = 'Your name '
      WRITE(NOUT,136) OTWORD
      READ(*,140) INWORD
      OTWORD = 'Run by '
      WRITE(4,133) OTWORD, INWORD
      OTWORD = 'Where from '
      WRITE(NOUT,136) OTWORD
      READ(*,140) INWORD
      OTWORD = 'From '
      WRITE(4,133) OTWORD, INWORD
      OTWORD = 'E-Mail address '
      WRITE(NOUT,136) OTWORD
      READ(*,140) INWORD
      WRITE(4,133) OTWORD, INWORD
      WRITE(4,131)
  131 FORMAT(/'Loop content                   Result',
     1     14X,'MFLOPS      MOPS   Seconds'/)
  133 FORMAT(2A)
C  136 FORMAT(1X,A\)
  136 FORMAT(1X,A18)
  140 FORMAT(A)
      DO 190 I = 1, 8
         IF (OPS(I).EQ.99999.0) THEN
             WRITE(4,157) HEADRS(I), RESULT(I),
     1                        FLOPS(I), TIMELP(I)
         ELSE
             WRITE(4,158) HEADRS(I), RESULT(I),
     1                          OPS(I), TIMELP(I)
         ENDIF
  190 CONTINUE
  
      WRITE(4,161) WIPS,SECTOT
  157 FORMAT(A, F25.17, 5X, F9.3, 11X, F9.3)
  158 FORMAT(A, F25.17, 15X, F9.3, 1X, F9.3)
  161 FORMAT(/'MWIPS',43X,F9.3,11X,F9.3/)
      WRITE(4,166)
  166 FORMAT ('Results  to  load  to  spreadsheet              ',
     1      '    MWIPS   Mflops1   Mflops2   Mflops3   Cosmops ',
     2      '  Expmops  Fixpmops    Ifmops    Eqmops')
      WRITE(4,168) WIPS, FLOPS(1), FLOPS(2), FLOPS(6), OPS(5),
     1             OPS(8), OPS(4), OPS(3), OPS(7)
  168 FORMAT ('Results  to  load  to  spreadsheet             ',
     1         9F10.3/)
      WRITE(NOUT,170)
  170 FORMAT (/' Results are in file Whets.txt'/)
    
      STOP
      
  200 WRITE(NOUT,201)
  201 FORMAT(/' Cannot open results file'/)
      STOP    
      END
C     
C

      SUBROUTINE WHETS(IXTRA,IX100,CALIB)
      IMPLICIT integer*8 (i-m)              
      IMPLICIT DOUBLE PRECISION ( A - H , O - Z )
      DOUBLE PRECISION T,T1,T2,E1,CHECK,RESULT
      DOUBLE PRECISION X,Y,Z
      COMMON T,T1,T2,E1(4),J,K,L
      COMMON WIPS, CHECK, SECTOT
      COMMON TIMELP(8), OPS(8), FLOPS(8), IJK, RESULT(8)
      DOUBLE PRECISION ESAVE(4)
c      T = 0.49999975D0
      T =  0.499975D0
      T0 = T
c      T1 = 0.50000025D0
      T1 =  0.500025D0
      T2 = 2.0D0
      N1 = 12*IX100
      N2 = 14*IX100
      N3 = 345*IX100
      N4 = 210*IX100
      N5 = 32*IX100
      N6 = 899*IX100
      N7 = 616*IX100
      N8 = 93*IX100      
      N1MULT = 10
C     N1 adjusted to give more accurate MFLOPS
      CHECK = 0.0
C
C
C***  Module 1 : Array elements
C
c first save the proper result of N1 passes thru E - this is needed
c to reset E for the next test (to avoid numerical underflow in PA)
c      
      E1(1) = 1.0D0
      E1(2) = -1.0D0
      E1(3) = -1.0D0
      E1(4) = -1.0D0
      T = T0
      DO 9 I=1,N1
         E1(1) = (E1(1)+E1(2)+E1(3)-E1(4))*T
         E1(2) = (E1(1)+E1(2)-E1(3)+E1(4))*T
         E1(3) = (E1(1)-E1(2)+E1(3)+E1(4))*T
         E1(4) = (-E1(1)+E1(2)+E1(3)+E1(4))*T
   9  CONTINUE
      ESAVE(1) = E1(1)
      ESAVE(2) = E1(2)
      ESAVE(3) = E1(3)
      ESAVE(4) = E1(4)
c
c now do the test...
c
      TIMEST=SECOND()
      DO 11 IX=1,IXTRA
          E1(1) = 1.0D0
          E1(2) = -1.0D0
          E1(3) = -1.0D0
          E1(4) = -1.0D0
          T = T0
c          DO 10 I=1,N1 * N1MULT
c             E1(1) = (E1(1)+E1(2)+E1(3)-E1(4))*T
c             E1(2) = (E1(1)+E1(2)-E1(3)+E1(4))*T
c             E1(3) = (E1(1)-E1(2)+E1(3)+E1(4))*T
c             E1(4) = (-E1(1)+E1(2)+E1(3)+E1(4))*T
c   10     CONTINUE
          T = 1.0 - T
   11 CONTINUE
      T = T0
      STIME = (SECOND() - TIMEST)/FLOAT(N1MULT)
      CALL POUT('N1 floating point ', DFLOAT(N1) * FLOAT(IXTRA)
     1                   * 16.0, 1, E1(4), STIME, CALIB, 1)

C
C***  Module 2 : Array as a parameter
      TIMEST = SECOND()
      DO 21 IX=1,IXTRA
C
c first, restire the proper initial values of E
c      
          E1(1) = ESAVE(1)
          E1(2) = ESAVE(2)
          E1(3) = ESAVE(3)
          E1(4) = ESAVE(4)
          T = T0
          DO 20 I=1,N2
             CALL PA(E1)
   20     CONTINUE          
          T = 1.0 - T
   21 CONTINUE
      T = T0
      STIME = SECOND() - TIMEST
      CALL POUT('N2 floating point ', DFLOAT(N2) * FLOAT(IXTRA)
     1                   * 96.0, 1, E1(4), STIME, CALIB, 2)
C
C***  Module 3 : Conditional jumps
C
      TIMEST = SECOND()
      DO 31 IX=1,IXTRA
         J = 1
         DO 30 I=1,N3
            IF(J.EQ.1) THEN
                J = 2
            ELSE
                J = 3
            ENDIF
            IF(J.GT.2) THEN
                J = 0
            ELSE
                J = 1
            ENDIF
            IF(J.LT.1) THEN 
                J = 1
            ELSE
                J = 0
            ENDIF
   30    CONTINUE
   31 CONTINUE
      STIME = SECOND() - TIMEST
      CALL POUT('N3 if then else   ', DFLOAT(N3) * FLOAT(IXTRA)
     1                 * 3.0, 2, DBLE(J), STIME, CALIB, 3)
C
C***  Module 4 : integer arithmetic
C
      TIMEST=SECOND()
      DO 41 IX=1,IXTRA
         J = 1
         K = 2
         L = 3
         DO 40 I=1,N4
             J = J * (K - J) * (L - K)
             K = L * K - (L - J) * K
             L = (L - K) * (K + J)
             E1(L - 1) = J + K + L
             E1(K - 1) = J * K * L
   40    CONTINUE
   41 CONTINUE             
      STIME = SECOND() - TIMEST
      CALL POUT('N4 fixed point    ', DFLOAT(N4) * FLOAT(IXTRA)
     1           * 15.0, 2, E1(1) + E1(2), STIME, CALIB, 4)
C
C***  Module 5 : trig functions
C
      TIMEST=SECOND()
      DO 51 IX=1,IXTRA
         X = 0.5D0
         Y = 0.5D0
         T = T0
         DO 50 I=1,N5
             X = T*DATAN(T2*DSIN(X)*DCOS(X)/(DCOS(X+Y)+DCOS(X-Y)-1.0D0))
             Y = T*DATAN(T2*DSIN(Y)*DCOS(Y)/(DCOS(X+Y)+DCOS(X-Y)-1.0D0))
   50    CONTINUE
         T = 1.0 - T
   51 CONTINUE
      T = T0
      STIME = SECOND() - TIMEST
      CALL POUT('N5 sin,cos etc.   ', DFLOAT(N5) * FLOAT(IXTRA)
     1                   * 26.0, 2, Y, STIME, CALIB, 5)
C
C***  Module 6 : procedure calls
C
      TIMEST=SECOND()
      DO 61 IX=1,IXTRA
         X = 1.0D0
         Y = 1.0D0
         Z = 1.0D0
         DO 60 I=1,N6
            CALL P3(X,Y,Z)
   60    CONTINUE
   61 CONTINUE         
      STIME = SECOND() - TIMEST
      CALL POUT('N6 floating point ',DFLOAT(N6) * FLOAT(IXTRA)
     1                   * 6.0, 1, Z, STIME, CALIB, 6)
C
C***  Module 7 : array references
C
      TIMEST = SECOND()
      DO 71 IX=1,IXTRA
         J = 1
         K = 2
         L = 3
         E1(1) = 1.0D0
         E1(2) = 2.0D0
         E1(3) = 3.0D0
         DO 70 I=1,N7
            CALL PO()
   70    CONTINUE 
   71 CONTINUE         
      STIME = SECOND() - TIMEST
      CALL POUT('N7 assignments    ', DFLOAT(N7) * FLOAT(IXTRA)
     1                    * 3.0, 2, E1(3), STIME, CALIB, 7)
C
C***  Module 8 : Standard functions
C
      TIMEST=SECOND()
      DO 81 IX=1,IXTRA
         X = 0.75D0
         DO 80 I=1,N8
            X = DSQRT(DEXP(DLOG(X) / T1))
   80    CONTINUE
   81 CONTINUE      
      STIME = SECOND() - TIMEST
      CALL POUT('N8 exp,sqrt etc.  ', DFLOAT(N8) * FLOAT(IXTRA)
     1                       * 4.0, 2, X, STIME, CALIB, 8)

      RETURN
      END
C
C
      SUBROUTINE PA(E)
      implicit integer*8 (i-m)
      IMPLICIT DOUBLE PRECISION ( A - H , O - Z )
      DOUBLE PRECISION T,T1,T2,E
      COMMON T,T1,T2
      DIMENSION E(4)
      J = 0
  100 E(1) = (E(1)+E(2)+E(3)-E(4))*T
      E(2) = (E(1)+E(2)-E(3)+E(4))*T
      E(3) = (E(1)-E(2)+E(3)+E(4))*T
      E(4) = (-E(1)+E(2)+E(3)+E(4))/T2
      J = J + 1
      IF(J.LT.6)THEN
          GOTO 100
      ENDIF
      RETURN
      END
C
C
      SUBROUTINE PO()
      implicit integer*8 (i-m)
      IMPLICIT DOUBLE PRECISION ( A - H , O - Z )
      DOUBLE PRECISION T,T1,T2,E1
      COMMON T,T1,T2,E1(4),J,K,L
      E1(J) = E1(K)
      E1(K) = E1(L)
      E1(L) = E1(J)
      RETURN
      END
C
C
      SUBROUTINE P3(X,Y,Z)
      implicit integer*8 (i-m)
      IMPLICIT DOUBLE PRECISION ( A - H , O - Z )
      DOUBLE PRECISION T,T1,T2,X1,Y1,X,Y,Z
      COMMON T,T1,T2
      X1=X
      Y1=Y
      X1=T*(X1+Y1)
      Y1=T*(X1+Y1)
      Z=(X1+Y1)/T2
      RETURN
      END
C
C
C
      SUBROUTINE POUT(TITLE,SMOPS,ITYPE,CHKSUM,STIME,CALIB,IPART)
      implicit integer*8 (i-m)
      IMPLICIT DOUBLE PRECISION ( A - H , O - Z )
      integer ITYPE,IPART
      DOUBLE PRECISION T,T1,T2,E1,CHECK,RESULT,CHKSUM
      COMMON T,T1,T2,E1(4),J,K,L
      COMMON WIPS, CHECK, SECTOT
      COMMON TIMELP(8), OPS(8), FLOPS(8), IJK, RESULT(8)
      COMMON/HEAD/HEADRS
      COMMON/IO/NOUT

      CHARACTER*18  HEADRS(8)
      CHARACTER TITLE*18

      CHECK = CHECK + CHKSUM
      TIMELP(IPART) = STIME
      HEADRS(IPART) = TITLE
      SECTOT = SECTOT + STIME
      IF (STIME.GT.0.0) THEN
         SMOPS = SMOPS/(1000000.0*STIME)
      ELSE
         SMOPS = 0.0
      ENDIF
      
      IF (CALIB.EQ.1) THEN
         RESULT(IPART) = CHKSUM
      ENDIF
      
      IF (CALIB.EQ.0) THEN
         IF (ITYPE.EQ.1) THEN
            FLOPS(IPART) = SMOPS
            OPS(IPART) = 99999.0
            WRITE(NOUT,27) HEADRS(IPART), RESULT(IPART),
     1                        FLOPS(IPART), TIMELP(IPART)
         ELSE
            OPS(IPART) = SMOPS
            FLOPS(IPART) = 0.0
            WRITE(NOUT,28) HEADRS(IPART), RESULT(IPART),
     1                          OPS(IPART), TIMELP(IPART)
         ENDIF
      ENDIF
   27 FORMAT(1X, A18, 2X, F24.17, 6X, F9.3, 11X, F9.3)
   28 FORMAT(1X, A18, 2X, F24.17, 16X, F9.3, 1X, F9.3)
      RETURN
      END

      FUNCTION SECOND()
C
C*****THE FOLLOWING OBTAINS ELAPSED TIME ON linux VIA
C*****THE gfortran FORTRAN COMPILER.
C     
      save
c      SECOND = mclock() * 0.001
      call cpu_time(SECOND)
C
C*****THE FOLLOWING OBTAINS ELAPSED TIME ON AN IBM PC VIA
C*****THE MS 5.1 FORTRAN COMPILER.
C
C
C
C      CALL GETTIM(IHR,IMIN,ISEC,IS100)
C      SECT=FLOAT(IHR*60+IMIN)*60+FLOAT(ISEC)
C      SECOND=SECT+FLOAT(IS100)/100.0
C
C*****THE FOLLOWING OBTAINS ELAPSED TIME ON AN IBM PC VIA
C*****THE IBM PROFESSIONAL FORTRAN COMPILER.
C
C     INTEGER*2 IHR,IMIN,ISEC,IS100
C     CALL GETTIM(IHR,IMIN,ISEC,IS100)
C     ISECT=(JFIX(IHR)*60+JFIX(IMIN))*60+JFIX(ISEC)
C     SECOND=FLOAT(ISECT)+FLOAT(IS100)/100.0
C
C*****THE ABOVE ALSO WORKS FOR PROSPERO FORTRAN ON THE IBM PC-AT
C*****EXCEPT THE INTEGERS MUST BE *4, THE SYSTEM ROUTINE IS TIME,
C*****NOT GETTIM, AND THE JFIXS ARE REDUNDANT
C
C*****THE FOLLOWING OBTAINS ELAPSED TIME ON A VAX
C*****ACCURATE TO 0.01 SECONDS
C
C     SECOND=SECNDS(0.0)
C
C*****THE FOLLOWING OBTAINS CPU SECONDS ON A VAX/VMS
C
C     INTEGER*4 STATUS,CTIM
C     INCLUDE '($JPIDEF)'
C     STATUS=LIB$GETJPI(JPI$_CPUTIM,,,CTIM,,)
C     SECOND=CTIM/100.
C
C*****THE FOLLOWING OBTAINS CPU TIME ON AN IBM 3090
C*****UNDER VM, RESOLUTION 1 MICROSECOND
C
C     SECOND=IQCPU(0.0)/1000000.0
C
C*****THE FOLLOWING OBTAINS ELAPSED TIME ON AN FPS164
C*****CTIM IS THE CPU TIME IF REQUIRED, BOTH IN SECONDS
C
C     CALL SYS$GETTIME(CTIM,ETIM)
C     SECOND=ETIM
C
C*****THE FOLLOWING OBTAINS ELAPSED TIME ON A SUN WORKSTATION
C*****RUNNING UNIX VERSION 3.2
C
C     DIMENSION TARRAY(2)
C     SECOND=ETIME(TARRAY)
C
C*****THE FOLLOWING OBTAINS ELAPSED TIME ON AN AMDAHL 1200
C
C     CALL TIME(I)
C     SECOND=FLOAT(I)/1000.
      RETURN
      END      
      
     
