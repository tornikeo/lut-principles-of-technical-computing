
clear all; close all; clc;

% Import all temperature data

raw_data1 = [
0 1.000 0.000
1 0.504 0.416
2 0.186 0.489
3 0.218 0.595
4 0.022 0.506
5 0.102 0.493
6 0.058 0.458
7 0.064 0.394
8 0.000 0.335
9 0.082 0.309
];

data1.temperature = 282; 
data1.time = raw_data1(:,1);
data1.y_true = raw_data1(:,2:end);

raw_data2 = [
0 1.000 0.000
1 0.415 0.518
2 0.156 0.613
3 0.196 0.644
4 0.055 0.444
5 0.011 0.435
6 0.000 0.323
7 0.032 0.390
8 0.000 0.149
9 0.079 0.222
];

data2.temperature = 313; 
data2.time = raw_data2(:,1);
data2.y_true = raw_data2(:,2:end);


data = data1;

% Constants
Tref = 300;
R = 8.314;

% Fminsearch Initial conditions
k1ref = 1;
E1 = 1e4;
k2ref = 1;
E2 = 1e4;

% ODE solver conditions
initial_conds = [1,0];
tspan = 0:1:9;

% K as a function of T, kref, E
k = @(T, kref, E) kref * exp(E / R * (1/T - 1/Tref));

% Returns solution [t,s] of ode, given our fminsearch params
solver = @(k1ref, E1, k2ref, E2) ode23( ...
    @model_ode, tspan, initial_conds, [],...
    k(data.temperature, k1ref, E1), k(data.temperature, k2ref, E2) ...
);

% Returns one number for one fminsearch param
loss = @(theta) sum(sum( (predict_y(theta,solver) - data.y_true).^2 ));


theta_init = [k1ref, E1, k2ref, E2];
theta_optim = fminsearch(loss, theta_init);

% loss(theta_optim)

function y_pred = predict_y(theta, solver)
    k1ref = theta(1);
    E1 = theta(2);
    k2ref = theta(3);
    E2 = theta(4);
    [t,y_pred] = solver(k1ref, E1, k2ref, E2);
end

function ds = model_ode(t, s, k1, k2)
    A = s(1);
    B = s(2);
    dA = -k1 * A;
    dB = k1 * A - k2 * B;
    ds = [dA;dB];
end
