%now we will define state-space
A=[0 0 1 0;0 0 0 1;0 -55.07 -0.317833 0;0 13.4918 29.6643 0];        
B=[0;0;41.438;-55.251];  
C=[1 0 0 0;0 1 0 0];    
state=ss(A,B,C,[])
%now we will find unit step plots for the state space 
%simulate state space for 8seconds
step(state)