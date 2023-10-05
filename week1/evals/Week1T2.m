clear all; clc; close all
t = 0:0.5:360; % angles measured in degrees
x = [cosd(t);sind(t)];%x and y coordinates combined into a matrix
%below we plot the unit circle
figure; hold on;
scatter(x(1,:),x(2,:));
plot([0,x(1,1)],[0,x(2,1)]);

A=[1 0.7; 0.7 1]; %Diagonal or any matrix
Ax=A*x; %making the tranformation
%below we plot the transformation to the unit circle and
%compare with the original unit circle
alpha = 45;
beta = 60;
M1_45 = [cosd(alpha), sind(alpha); -sind(alpha), cosd(alpha)];
Y1_45 = M1_45 * x
M1_60 = [cosd(beta), sind(beta); -sind(beta), cosd(beta)];
Y1_60 = M1_60 * x
figure; hold on;
scatter(Y1_45(1,:),Y1_45(2,:));
plot([0,x(1,1)],[0,x(2,1)]);
scatter(Y1_60(1,:),Y1_60(2,:));
plot([0,x(1,1)],[0,x(2,1)]);
scatter(Ax(1,:),Ax(2,:));
plot([0,Ax(1,1)],[0,Ax(2,1)]);
hold off; grid on; axis equal;


