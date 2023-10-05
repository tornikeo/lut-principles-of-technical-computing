clear all; close all; clc;
x = [5 7 11 12 15 17 19]';
y = [0.93 0.91 0.84 0.82 0.76 0.71 0.66]';
n = length(x);
x_tr = [ones(n,1) x .^ 2];
y_tr = log(1 ./ y);
theta = x_tr \ y_tr;
y_hat = 1 ./ (exp(theta(1) + theta(2) * (x .^ 2)));
plot(x, y, '-', x, y_hat, 'x')
