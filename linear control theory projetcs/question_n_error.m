%define state space
A=[0 1 0;0 -1 2;0 0 -2];
B=[0;0;1]
C=[1 0 0];

% define K obtained in previous problem
K=[312 114 26];

%using eigen values we will find L matrix
poles=[-40,-120,-130];
L=place(A',C',poles)

%now we will find A1, B1 and C1
A1=[A-B*K B*K;zeros(size(A)) A-L'*C]
B1=[B;zeros(size(B))]
C1=[C C]

%defining state space of error sysytem
errorsys=ss(A1,B1,C1,[])

%next we will plot by considering initial condition
[y,t,x]=initial(errorsys,[0;0;0;0.001;0;0])
figure(1);
plot(t,x(:,4),'r')
hold on
plot(t,x(:,6),'b')
plot(t,x(:,5),'m')
%plot(t,x(:,4))
hold off