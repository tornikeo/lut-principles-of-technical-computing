clear; close all; clc;
%Fit for the nonlinear model y =x/(exp(θ1+θ2x) + 1) using Matlab backslash

X = [5 7 11 12 15 17 19]'; % X(input) data
Y = [1.83    2.53   3.87   4.20   5.14    5.75  6.35]'; % Y(response) data
n = length(X); % extract the length of data
XX = [ones(n,1) X]; % Define the coefficient matrix
YY = log(X-Y)-log(Y);%you can also use log((X-Y)./Y); % log transformation
params = XX\YY; % estimate the parameters
theta = params;%no back transformation for the parameters
Yfit =X./(exp(theta(1)+theta(2)*X)+1); % Get the fitted values

figure(1);
plot(X,Y,'o',X,Yfit) % plot data and fitted values
title('model fit');
grid on


%% Second approach (Salem)

X = [5 7 11 12 15 17 19]'; % X(input) data
Y = [1.83    2.53   3.87   4.20   5.14    5.75  6.35]'; % Y(response) data
n = length(X); % extract the length of data
XX = [ones(n,1) X]; % Define the coefficient matrix
YY = log(1./Y-1./X)+log(X); % log and reciprocal transformation
params = XX\YY; % estimate the parameters
theta = params;%no back transformation for the parameters
Yfit =X./(exp(theta(1)+theta(2)*X)+1); % Get the fitted values

figure(2);
plot(X,Y,'o',X,Yfit) % plot data and fitted values
title('model fit');
grid on
























