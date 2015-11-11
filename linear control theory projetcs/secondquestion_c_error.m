%now we will define state-space
A=[0 0 1 0;0 0 0 1;0 -55.07 -0.317833 0;0 13.4918 29.6643 0];        
B=[0;0;41.438;-55.251];  
C=[1 0 0 0;0 1 0 0]

%next we wil consider feedback matrix from last question
K=[0 -1.3270 -0.0086 -0.0491];

poles=[-25,-30,-35,-1000];
L=place(A',C',poles)

%now we will deifine A1,B1,C1
A1=[A-B*K B*K;zeros(size(A)) A-L'*C];
B1=[B;zeros(size(B))];
C1=[C C];

%next we will define error state-space sysyem
errorsys=ss(A1,B1,C1,[])

%considering initials and plot 
[y,t,x]=initial(errorsys,[pi/180 3*pi/180 0 0 0 5*pi/180 0 0])

figure(1);
plot(t,x(:,4),'r')
hold on
plot(t,x(:,6),'b')
plot(t,x(:,5),'m')
%plot(t,x(:,4))
hold off

