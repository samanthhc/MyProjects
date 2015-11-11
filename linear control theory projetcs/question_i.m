
%define state space
A=[0 1 0;0 -1 2;0 0 -2]
B=[0;0;1]
C=eye(3)    
state=ss(A,B,C,[])
%now we will find unit step plots for the state space 
%simulate state space for 8seconds
step(state,8)
