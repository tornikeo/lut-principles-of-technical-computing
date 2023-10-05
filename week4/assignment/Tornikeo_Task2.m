clear all; close all; clc;

% load data_8.mat
x = [0;2;4;7;9;10];
yr = [0.775191293313970;29.901045174207370;7.358099321457987e+02;208;1.697974452174200;1.539484676153329];

p = polyfit(x, yr, 2);
x_fine = 0:.5:10;
y_polyfit = polyval(p, x_fine);

y_lsq_tr = [log(yr)];
x_lsq_tr = [ones(length(x),1) x x.^2];
theta_lsq = y_lsq_tr \ x_lsq_tr;
y_lsq_fit = exp(theta_lsq .* x_lsq_tr);

model = @(x) exp(b0 + b1 .* x + b2 .* x.^2);
loss = @(b) sum((exp(b(1) + b(2) .* x + b(3) .* x.^2) - yr) .^ 2);
b_optim = fminsearch(loss, [1,2,3] .* 1e-1);
model_optim = @(x) exp(b_optim(1) + b_optim(2) .* x + b_optim(3) .* x.^2);

optim_fit = model_optim(x_fine);

plot(x, yr, 'o'); hold on
plot(x_fine, y_polyfit,'r-'); hold on;
plot(x_fine, optim_fit,'b-');
ylim([0, inf])

legend( {'Measured', 'Polynomial Fit', 'LSQ Exponential Fit' })