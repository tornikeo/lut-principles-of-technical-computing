clear ;close all; clc;
%a=linspace(0.99,1,100);
a=0.9
a2=0.999

% Create points on the unit circle
t=0:0.5:360; x=[cosd(t);sind(t)];

% Plot the unit circle
A=[1 a;a 1]; %Diagonal or any matrix
A2=[1 a2;a2 1]; %Diagonal or any matrix

% Scale with matrix 
Ax=A*x;
figure; hold on;
scatter(x(1,:),x(2,:),'b');
plot([0,x(1,1)],[0,x(2,1)],'b-o','LineWidth',2);
scatter(Ax(1,:),Ax(2,:),'r');
plot([0,Ax(1,1)],[0,Ax(2,1)],'r-o','LineWidth',2);
hold off; grid on; axis equal;
axis([-2 2 -2 2]);
axis square;
grid on;
hold off;

% Scale with matrix 
Ax=A2*x;
figure; hold on;
scatter(x(1,:),x(2,:),'b');
plot([0,x(1,1)],[0,x(2,1)],'b-o','LineWidth',2);
scatter(Ax(1,:),Ax(2,:),'r');
plot([0,Ax(1,1)],[0,Ax(2,1)],'r-o','LineWidth',2);
hold off; grid on; axis equal;
axis([-2 2 -2 2]);
axis square;
grid on;
hold off;

%All points gets plotted close to x=y line