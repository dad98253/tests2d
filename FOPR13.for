      PROGRAM DOWHET
      parameter ( numloop = 75389 )
      common /name1/ lastcall
      logical lastcall
      lastcall = .false.
      print *," starting do loop... numloop = ", numloop
      start = second()
      DO 100 I = 1,numloop-1
C     should run for over 100 seconds      
         CALL WHETS
100   CONTINUE
      lastcall = .true.
      call WHETS
      elapsed = second() - start
      amweps = numloop * 10. / elapsed
      print *," Mega Whets per Second = " , amweps
      stop
      END 
      SUBROUTINE WHETS
C CENTRAL COMPUTER AGENCY PROGRAM FOPR13 
C BENCHMARK NO 6 = SYNTH FORD IN NPL REPORT NAC62 
C THIS PROGRAM HAS A SINGLE PARAMETER I 
C SET I=91 FOR ONE MINUTE ON MACHINE OF POWER OF 360/65 
C SET I=9 FOR MACHINE 1/10 POWER OF 360/65 
C SET I=914 FOR MACHINE TEN TIMES POWER OF 360/65 
      DOUBLE PRECISION X1, X2, X3, X4, X,Y,Z,T,T1,T2,E1 
      COMMON T,T1,T2,E1(4),J,K,L 
      T=0.499975 
      T1=0.50025 
      T2=2.0 
      I = 100
      N1=0 
      N2=12*I 
      N3=14*I 
      N4=345*I 
      N5=0 
      N6=210*I 
      N7=32*I 
      N8=899*I 
      N9=616*I 
      N10=0 
      N11=93*I 
      N12=0 
      X1=1.0 
      X2=-1.0 
      X3=-1.0 
      X4=-1.0 
      IF(N1)19,19,11 
   11 DO 18 I=1,N1,1 
      X1=(X1+X2+X3-X4)*T 
      X2=(X1+X2-X3+X4)*T 
      X3=(X1-X2+X3+X4)*T
      X4=(-X1+X2+X3+X4)*T 
   18 CONTINUE 
   19 CONTINUE 
      CALL POUT(N1,N1,N1,X1,X2,X3,X4) 
      E1(1)=1.0 
      E1(2)=-1.0 
      E1(3)=-1.0 
      E1(4)=-1.0 
      IF(N2)29,29,21 
   21 DO 28 I=1,N2,1 
      E1(1)=(E1(1)+E1(2)+E1(3)-E1(4))*T 
      E1(2)=(E1(1)+E1(2)-E1(3)+E1(4))*T 
      E1(3)=(E1(1)-E1(2)+E1(3)+E1(4))*T 
      E1(4)=(-E1(1)+E1(2)+E1(3)+E1(4))*T 
  28  CONTINUE
  29  CONTINUE 
      CALL POUT(N2,N3,N2,E1(1),E1(2),E1(3),E1(4)) 
      IF(N3)39,39,31 
   31 DO 38 I=1,N3,1 
   38 CALL PA(E1) 
   39 CONTINUE 
      CALL POUT(N3,N2,N2,E1(1),E1(2),E1(3),E1(4)) 
      J=1
      IF(N4) 49,49,41 
   41 DO 48 I=1,N4,1 
      IF(J-1)43,42,43 
   42 J=2 
      GOTO 44 
   43 J=3 
   44 IF(J-2)46,46,45 
   45 J=0 
      GO TO 47 
   46 J=1 
   47 IF(J-1)411,412,412 
  411 J=1 
      GO TO 48 
  412 J=0 
   48 CONTINUE 
   49 CONTINUE 
      CALL POUT(N4,J,J,X1,X2,X3,X4) 
      J=1 
      K=2 
      L=3 
      IF(N6)69,69,61 
   61 DO 68 I=1,N6,1 
      J=J*(K-J)*(L-K) 
      K=L*K-(L-J)*K 
      L=(L-K)*(K+J) 
      E1(L-1)=J+K+L 
      E1(K-1)=J*K*L 
   68 CONTINUE 
   69 CONTINUE 
      CALL POUT(N6,J,K,E1(1),E1(2),E1(3),E1(4)) 
      X=0.5 
      Y=0.5 
      IF(N7)79,79,71 
   71 DO 78 I=1,N7,1 
      X=T*DATAN(T2*DSIN(X)*DCOS(X)/(DCOS(X+Y)+DCOS(X-Y)-1.0)) 
      Y=T*DATAN(T2*DSIN(Y)*DCOS(Y)/(DCOS(X+Y)+DCOS(X-Y)-1.0)) 
   78 CONTINUE 
   79 CONTINUE 
      CALL POUT(N7,J,K,X,X,Y,Y) 
      X=1.0 
      Y=1.0 
      Z=1.0 
      IF(N8)89,89,81 
   81 DO 88 I=1,N8,1 
   88 CALL P3(X,Y,Z) 
   89 CONTINUE 
      CALL POUT(N8,J,K,X,Y,Z,Z) 
      J=1 
      K=2 
      L=3 
      E1(1)=1.0 
      E1(2)=2.0 
      E1(3)=3.0 
      IF(N9) 99,99,91 
   91 DO 98 I=1,N9,1 
   98 CALL P0 
   99 CONTINUE 
      CALL POUT(N9,J,K,E1(1),E1(2),E1(3),E1(4)) 
      J=2 
      K=3 
      IF (N10) 109,109,101 
  101 DO 108 I=1,N10,1 
      J=J+K 
      K=J+K 
      J=J-K 
      K=K-J-J 
  108 CONTINUE 
  109 CONTINUE 
      CALL POUT(N10,J,K,X1,X2,X3,X4) 
      X=0.75 
      IF (N11) 119,119,111 
  111 DO 118 I=1,N11,1 
  118 X=DSQRT(DEXP(DLOG(X)/T1)) 
  119 CONTINUE 
      CALL POUT(N11,J,K,X,X,X,X) 
      RETURN
      END 
      SUBROUTINE PA(E) 
      DOUBLE PRECISION T,T1,T2,E 
      COMMON T,T1,T2 
      DIMENSION E(4) 
      J=0
    1 E(1)=(E(1)+E(2)+E(3)-E(4))*T 
      E(2)=(E(1)+E(2)-E(3)+E(4))*T 
      E(3)=(E(1)-E(2)+E(3)+E(4))*T 
      E(4)=(-E(1)+E(2)+E(3)+E(4))/T2 
      J=J+1 
      IF (J-6) 1,2,2 
    2 CONTINUE 
      RETURN 
      END 
      SUBROUTINE P0 
      DOUBLE PRECISION T,T1,T2,E1
      COMMON T,T1,T2,E1(4),J,K,L 
      E1(J)=E1(K) 
      E1(K)=E1(L) 
      E1(L)=E1(J) 
      RETURN 
      END 
      SUBROUTINE P3(X,Y,Z) 
      DOUBLE PRECISION T,T1,T2,X1,Y1,X,Y,Z
      COMMON T,T1,T2 
      X1=X 
      Y1=Y 
      X1=T*(X1+Y1) 
      Y1=T*(X1+Y1) 
      Z=(X1+Y1)/T2 
      RETURN 
      END 
      SUBROUTINE POUT(N,J,K,X1,X2,X3,X4) 
      DOUBLE PRECISION X1,X2,X3,X4 
      common /name1/ lastcall
      logical lastcall
      if (.not.lastcall) return      
      WRITE(6,1) N,J,K,X1,X2,X3,X4 
   1  FORMAT(1H ,3I7,4E12.4) 
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
      return
      end
