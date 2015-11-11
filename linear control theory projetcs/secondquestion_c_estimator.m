%SAMANTH(N13452775)

%now we will define state-space
A=[0 0 1 0;0 0 0 1;0 -55.07 -0.317833 0;0 13.4918 29.6643 0];        
B=[0;0;41.438;-55.251];  
C=[1 0 0 0;0 1 0 0]

%next we wil consider feedback matrix from last question
K=[0 -1.3270 -0.0086 -0.0491];

%consider eigen values to define poles
poles=[-25,-30,-35,-1000];

%now we will find full-order observer matrix L
L=place(A',C',poles)

%now we will deifine A1,B1,C1
A1=[A -B*K ;L'*C A-(B*K)-(L'*C)];
B1=[B;B];
C1=[C zeros(size(C))];

%next we will define FEEDBACKESTIMATOR state-space sysyem
fbestimator=ss(A1,B1,C1,[])

%considering initials and plot 
[y,t,x]=initial(fbestimator,[pi/180 3*pi/180 0 0 0 5*pi/180 0 0])

plot(t,x(:,1),t,x(:,2))
title('feedback estimator closed loop system response')
