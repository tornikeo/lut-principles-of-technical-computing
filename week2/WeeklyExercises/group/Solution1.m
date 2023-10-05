clear all; close all; clc;
tspan = [0 10];
initial_state = [
    2, % x(0) = 2
    3, % z(0) = 3
];
[t,y] = ode23( ...
    @myfunction, ...
    tspan, ...
    initial_state);
figure
plot(t, y)
title('Numerical solution')

syms x(t) z(t)

eqn = [
    diff(x, t) == z + 4;
    diff(z, t) == -3 * x;
]
conds = [
    x(0) == 2;
    z(0) == 3;
]
S = dsolve(eqn, conds);
figure
fplot(S.x, [0 10]); hold on;
fplot(S.z, [0 10]); 
title("Symbolic solution")

function ds = myfunction(t, x)
    ds = [
        x(2) + 4;
        -3 * x(1);
    ];
end