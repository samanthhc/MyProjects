%SAMANTH(N13452775)

%define state space
A=[0 1 0;0 -1 2;0 0 -2];
B=[0;0;1]
C=[1 0 0];

%using eigen values we will find full order observer L matrix
poles=[-40,-120,-130];
L=place(A',C',poles)

%now we will find observer error system
errorsys=ss(A-L'*C,B,C,[])
initial(errorsys,[0;0;0])
