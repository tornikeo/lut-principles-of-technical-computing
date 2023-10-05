% Task 3: VALMIS
clear; close all; clc;

% Data
X = [1, 4, 7, 11, 14, 19, 21, 23]'
Y = [0.13, 0.24, 0.27, 0.29, 0.30, 0.31, 0.31, 0.31]'

% number of data points
n = length(X)

% Defining the coefficient matrix
XX = [ones(n,1), 1./X]
YY = 1./Y

% Estimate parameters
params = XX\YY
theta1 = params(2)
theta2 = params(1)
theta = [theta1, theta2]

% Get the fitted values
Yfit = X./(theta(1)+theta(2)*X)

% Plot the data with fitted values
figure(3);
plot(X,Y,'o',X,Yfit); title('model fit 3');
grid on