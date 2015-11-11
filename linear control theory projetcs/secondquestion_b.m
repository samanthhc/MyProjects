%SAMANTH(N13452775)

%now we will define state-space
A=[0 0 1 0;0 0 0 1;0 -55.07 -0.317833 0;0 13.4918 29.6643 0];        
B=[0;0;41.438;-55.251];  
C=[1 0 0 0;0 1 0 0];

%now we will define eigen values and find poles
p=[-1.2655*02, -0.0211*02 (-0.0248 + 0.0201i) *02 (-0.0248-0.0201i)*02]

%next we will find full-state feedback controller matrix k
K=place(A,B,p)

%now we will define feedback system state-space
fbsys=ss(A-B*K,[],C,[])

%next we will consider initial condition and simulation response
initial(fbsys,[pi/180 3*pi/180 0 0])

title ('closed loop full-order feedback controlller');