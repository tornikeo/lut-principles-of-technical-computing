clear; close all; clc;
%Fitting the nonlinear model y =θ1x/θ2 + x using matlab backslash 
X = [1:2:8, 9 13 17]'; % X(input) data
Y = [2.00    3.60    4.29    4.67    4.91    5.20    5.37]'; % Y(response) data
n = length(X); % extract the length of data

% y_tr = 1 ./ Y;
% x_tr = [ ones(n,1) 1./X];
% theta_tr = x_tr \ y_tr;
% theta =  [1./theta_tr(1), theta_tr(2)./theta_tr(1)];
% y_hat = (theta(1) .* X) ./ (theta(2) + X);
% plot(X,Y,'-',X, y_hat,'x')



XX = [ones(n,1) 1./X]; % Define the coefficient matrix
YY = 1./Y; % reciprocal transformation
params = XX\YY; % estimate the parameters
theta1 = 1/params(1); % recover the original parameter values
theta2 = params(2)*theta1;
theta = [theta1, theta2];
Yfit = (theta(1).*X)./(theta(2)+X); % Get the fitted values
figure;
plot(X,Y,'o',X,Yfit) % plot data and fitted values
title('model fit');
grid on














 

