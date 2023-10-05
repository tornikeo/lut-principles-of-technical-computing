close all; clc; clear all;

y0 = [2; 0.99005];
tspan = [-5 5];
M = [1 0; 0 0];
options = odeset('Mass',M,'RelTol',1e-4,'AbsTol',[1e-6 1e-6],'Stats','on');
[t,y] = ode15s(@func,tspan,y0,options);
plot(t,y)
function ds = func(t, x)
    ds = [
        -2 * x(1) + x(2) ^ 2;
        2 * x(1) - 100 * log(x(2)) - 5;
    ];
end