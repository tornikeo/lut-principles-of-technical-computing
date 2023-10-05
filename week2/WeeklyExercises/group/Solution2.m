close all; clc; clear all;

% Numeric
tspan = [0 60 * 4];
initial_state = [
    0; % this is x(1)
    0; % this is x(2)
];

k1 = 0.06;
k2 = 0.03;
a = 4;

[t,s] = ode23( @func, tspan, initial_state, [], k1, k2, a );
% x(1) is x_1
% x(2) is x_2

plot(t, s)
title("Numerical solution")

syms x1(t) x2(t)

eqns = [
    diff(x1, t) == -k1 * x1 + a;
    diff(x2, t) == -k1 * x1 - k2 * x2 + a;
];
conds = [
    x1(0) == 0;
    x2(0) == 0;
];
S = dsolve(eqns, conds);

figure
fplot(S.x1, tspan); hold on;
fplot(S.x2, tspan); hold on;
title("Symbolic solution")

function ds = func( t, x, k1, k2, a )
    ds = [
        -k1 * x(1) + a;
        -k1 * x(1) - k2 * x(2) + a;
    ];
end