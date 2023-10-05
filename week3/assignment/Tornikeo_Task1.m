clear all; close all; clc;
y = [26.5 57.9 108.4 155.9 209.3 272.4 384.3]';
x1 = [2.1 4.3 7.0 9.1 10.5 12.7 15.2]';
x2 = [10.4 15.5 21.0 24.9 30.3 33.8 41.4]';
n = length(x1);
x_tr = [ones(n:1) x1 x2 x1.*x2];
theta = x_tr \ y;
y_hat = x_tr * theta;
plot(1:n, y, '-', 1:n, y_hat, 'x');

