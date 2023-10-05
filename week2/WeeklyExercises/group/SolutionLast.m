close all; clc; clear all;

tspan = [0 10];
initial_conditions = [
        2000;
        100;
    ];
k = 5;
k_s = 20;
y = 0.05;
b = 0.01;
[t,s] = ode45(@func, tspan, initial_conditions, [], k, k_s, y, b);

plot(t,s, '-x')
title("Numerical solution")
syms s(t) x(t)
% Symbolc solution doesnt exist
% dsolve( ...
%     [
%       diff(s,t) ==  - (k * s * x) / (k_s + s);
%       diff(x,t) == y * (k * s * x) / (k_s + s) - b * x;
%     ],...
%     [ s(0) == 2000; x(0) == 100 ]...
%     );

"Symbolic solution doesn't exist. "

function ds = func(t, params, k, k_s, y, b)
    s = params(1);
    x = params(2);
    ds = [
        - (k * s * x) / (k_s + s);
        y * (k * s * x) / (k_s + s) - b * x;
    ];
end