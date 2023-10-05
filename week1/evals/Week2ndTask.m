% Let α be any angle in the interval [0; π]. Create an orthonormal 2 × 2 matrix using sin(α) and cos(α) as the components. Verify graphically the cases where the matrix rotates the unit circle 45 and 60 degrees in clockwise and counterclockwise directions.

clearvars; close all; clc; % Clearing variables from memory, closing all, and clearing the command window

% Values for the unit circle
t = 0:0.5:360;
x = [cosd(t); sind(t)];

figure;
hold on
plot(x(1,:),x(2,:),'b');
plot([0,x(1,1)],[0,x(2,1)],'b-o','LineWidth',2);
axis equal

% Degrees
alpha = 45; % Corrected variable name
beta = 60;

% Clockwise 45
M1_45 = [cosd(alpha), -sind(alpha); sind(alpha), cosd(alpha)];
y1_45 = M1_45*x;

% Counterclockwise 45
M2_45 = [cosd(alpha), sind(alpha); -sind(alpha), cosd(alpha)];
y2_45 = M2_45*x;

% Clockwise 60
M1_60 = [cosd(beta), -sind(beta); sind(beta), cosd(beta)];
y1_60 = M1_60*x;

% Counterclockwise 60
M2_60 = [cosd(beta), sind(beta); -sind(beta), cosd(beta)];
y2_60 = M2_60*x;

% Plotting the rotated unit circles
plot(y1_45(1,:), y1_45(2,:), 'r--', 'LineWidth', 2);
plot(y2_45(1,:), y2_45(2,:), 'g--', 'LineWidth', 2);
plot(y1_60(1,:), y1_60(2,:), 'm--', 'LineWidth', 2);
plot(y2_60(1,:), y2_60(2,:), 'c--', 'LineWidth', 2);

legend('Unit Circle', 'Initial Angle', 'Clockwise 45', 'Counterclockwise 45', 'Clockwise 60', 'Counterclockwise 60');
title('Rotation of the Unit Circle');