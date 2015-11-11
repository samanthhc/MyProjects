l1 = 0.050; % length of first arm
l2 = 0.070; % length of second arm
l3 = 0.056; 

theta2 = 0:0.1:pi; % all possible theta1 values
theta3 = 0:0.1:pi; % all possible theta2 values


[THETA2, THETA3] = meshgrid(theta2, theta3); % generate a grid of theta1 and theta2 values
 
X = l1 + l2 * cos(THETA2) + l3 * cos(THETA2 + THETA3); % compute x coordinates
Y =  l2 * sin(THETA2) + l3 * sin(THETA2 + THETA3); % compute y coordinates


data1 = [X(:) Y(:) THETA2(:)]; % create x-y-theta2 dataset
data2 = [X(:) Y(:) THETA3(:)]; % create x-y-theta3 dataset


 plot(X(:), Y(:), 'r.');
  axis equal;
  xlabel('X','fontsize',10)
  ylabel('Y','fontsize',10)
  title('X-Y co-ordinates generated for all theta2 and theta3 combinations using forward kinematics formula','fontsize',10)