% First define state space system
A=[0 1 0; 0 -1 2; 0 0 -2]
B=[0;0;1]
C=[1 0 0]
D=[0]
%consider b=numerator and a=denominator
[b,a]=ss2tf(A,B,C,D)
mySys_tf=tf(b,a)