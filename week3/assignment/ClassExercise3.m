
clear; close all; clc;

%Fit for the nonlinear model y = θ1x^θ2 using matlab backslash 
X = [1:3:9, 11 14 19 21 23]'; % X(input) data
Y = [2.04 128.01 686.04 2662.01 5488.01 13718.07 18522.07 24334.07]'; % Y(response) data
n = length(X); % extract the length of data
y_tr = log(Y);
x = [ones(n, 1) log(X)];
theta = x \ y_tr;
y_hat = exp(theta(1)) * X .^ theta(2);
plot(X,Y); hold on;
plot(X,y_hat,'x');

% figure
% XX = [ones(n,1) log(X)]; % Define the coefficient matrix
% YY = log(Y); % log transformation
% params = XX\YY; % estimate the parameters
% theta1 = exp(params(1)); % recover the original parameter values
% theta2 = params(2);
% theta = [theta1, theta2];
% Yfit = theta(1)*X.^theta(2); % Get the fitted values
% 
% figure;
% plot(X,Y,'o',X,Yfit) % plot data and fitted values
% title('model fit');
% grid on
% 
% % 
% 










