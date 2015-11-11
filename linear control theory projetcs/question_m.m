%SAMANTH(N13452775)

%define state space
A=[0 1 0;0 -1 2;0 0 -2];
B=[0;0;1]
C=[1 0 0];

%defining poles 
poles=[-4 -12 -13]

%finding full order feedback controller matrix K
K=place(A,B,poles)

%now we will define the state-space for feedback controller system
fbsys=ss(A-B*K,[],C,[])

initial(fbsys,[0 0 0])
