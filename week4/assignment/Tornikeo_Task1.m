clear all; close all; clc;

% We have to find k1, k2
k1 = .001;
k2 = .0001;

T_0 = 31;
T_a = 23;
T_w = 5;

t_meas = [0 : 60 : 540, 840 1020 1320]';
T_meas = [31 28 24 20 17.5 15.5 13.5 12 11 10 8 7 6.5]';

model = @(t) (T_0 - (k1 .* T_w + k2 .* T_a) ./ (k1 + k2) ) .* exp( - (k1 + k2) * t ) ...
     + (k1 .* T_w + k2 .* T_a) ./ (k1 + k2);

init_fit = model(t_meas);

optimizable_model = @(t, k1, k2) (T_0 - (k1 .* T_w + k2 .* T_a) ./ (k1 + k2) ) .* exp( - (k1 + k2) * t ) ...
     + (k1 .* T_w + k2 .* T_a) ./ (k1 + k2);

loss = @(k)  sum((optimizable_model(t_meas, k(1), k(2)) - T_meas) .^ 2);

k_init = [k1, k2];
k_optim = fminsearch(loss, k_init);
optim_fit = optimizable_model(t_meas, k_optim(1), k_optim(2));

plot(t_meas, T_meas, 'o', t_meas, optim_fit, '-')
legend measured fit;