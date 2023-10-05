clear all; close all; clc;
% Week 3 Task 3
% Fitting the nonlinear model y =x/θ1+θ2x

% y = x / (θ1 + θ2x)
% x/y = θ1 + θ2x

% The data
X = [1 4 7 11 14 19 21 23]'; % X(input) data
Y = [0.13 0.24 0.27 0.29 0.30 0.31 0.31 0.31]'; % Y(response) data
n = length(X); % extract the length of data

XX = [ones(n,1) X]; % define the coefficient matrix
YY = X/Y; % reciprocal transformation
params = XX\YY; %estimate the paramets
theta1 = params(1);
theta2 = params(2);
theta = [theta1, theta2];

Yfit = X./(theta1+theta2*X); %get the fitted values

figure;
plot(X,Y,'o',X,Yfit) %plot data and fitted values
title('model fit');
grid on 

