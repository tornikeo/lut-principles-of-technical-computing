clear all; close all; clc;
% load('data_1.mat')
% x = xy(:,1);
% y = xy(:,2);
% n = length(x);
% y_tr = - log (1./y);



% have:y = 1/(exp(theta_0 + theta_2 * x^2)
% need:y_hat = theta_0_hat + theta_1_hat * x_hat
% have: all y's and all x's. So, stuff like log(y), log(x), y/x, x/y, etc
% are all available for use.
% So, let's first do this:
% y_hat_1 = 1/y = exp(theta_0 + theta_2 * x^2)
% y_hat_2 = log(y_hat_1) = theta_0 + theta_2 * x.^2;
% x_hat = x.^2
% y_hat_2 = theta_0 * 1 + theta_2 * x_hat % we can only solve for theta0,theta1
% if we can write this into vector form...
% y_hat_2 = (1, x_hat(1)) * (theta_0 theta_2)^T; % SOLVABLE with "\"
%   y_tr            x_tr,             theta
% solution is theta = x_tr\y_tr
% 

% x = [1 4 7 11 14 19 21 23]';
% y = [0.13 0.24 0.27 0.29 0.30 0.31 0.31 0.31]';
% xy exists
% x = xy(:,1);
% y = xy(:,2);
x = [1 4 7 11 14 19 21 23]';
y = [0.13 0.24 0.27 0.29 0.30 0.31 0.31 0.31]';
n = length(x);
% y_tr = log(x ./ y);
% x_tr = [ ones(n,1) x ];
% theta = x_tr \ y_tr
% y_hat = x ./ (exp(theta(1) + theta(2) .* x) + 1);
% y_tr = log(1./y)
% x_tr = [ones(n, 1) x.^2]
% theta = x_tr \ y_tr;
% y_hat = 1./(exp(theta(1) + theta(2) * x.^2));

x_tr = [ones(n,1) x];
y_tr = x ./ y;
theta = x_tr \ y_tr;
y_hat = x ./ (theta(1) + theta(2) .* x);
plot(x, y, '-', x, y_hat, 'x')
