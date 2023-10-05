clear all; close all; clc

x = [0.0 1.0 1.0 2.0 1.8 3.0 4.0 5.2 6.5 8.0 10.0]';
y = [5.00 5.04 5.12 5.28 5.48 5.72 6.00 6.32 6.68 7.08 7.52]';
n = length(x);
errs = zeros(n,1);

x_tr = [ones(n, 1), x];
theta = x_tr \ y;

repmeas = [1,2];
sig = std(y(repmeas));

cov_theta = sig^2 * inv(x_tr' * x_tr)

std_theta = sqrt(diag(cov_theta));
t_theta = theta ./ std_theta

y_fit = x_tr * theta;
R2 = 1 - sum( (y - y_fit).^2 ) / sum( (y - mean(y)).^2 )