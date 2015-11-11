%SAMANTH(N13452775)

%now we will define state-space
A=[0 0 1 0;0 0 0 1;0 -55.07 -0.317833 0;0 13.4918 29.6643 0];        
B=[0;0;41.438;-55.251];  
C=[1 0 0 0;0 1 0 0];

%now we will define poles from given eigen values
poles=[-25,-30,-35,-1000];

%now we will find full-order observer matrix L
L=place(A',C',poles)

%now we will define error system state-space
errorsys=ss(A-L'*C,B,C,[])

%next we will consider initial condition and plot response
initial(errorsys,[pi/180 3*pi/180 0 0])