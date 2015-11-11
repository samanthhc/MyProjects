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
A1=[A -B*K;L'*C A-(B*K)-(L'*C)]
B1=[B;B]
C1=[C zeros(size(C))]

%defining state space of feedback estimate system
fbestimator=ss(A1,B1,C1,[])

%next we will plot by considering initial condition
[y,t,x]=initial(fbestimator,[0;0;0;0.001;0;0])

plot(t,x(:,1),t,x(:,2))
title('FEEDBACK ESTIMATOR CLOSED LOOP RESPONSE')
