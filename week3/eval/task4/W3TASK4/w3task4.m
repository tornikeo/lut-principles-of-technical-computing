clear all; clc;

X = [5 7 11 12 15 17 19]';
Y = [0.93 0.91 0.84 0.82 0.76 0.71 0.66]';
n = length(X);
XX = [ones(n,1) X.^2];
YY = log(Y);
params = XX\YY;
theta1 = params(1);
theta2 = params(2);
Yfit = exp(theta1+theta2 * X.^2);

figure;
plot(X,Y,'o',X,Yfit) % plot data and fitted values
title('model fit');
grid on