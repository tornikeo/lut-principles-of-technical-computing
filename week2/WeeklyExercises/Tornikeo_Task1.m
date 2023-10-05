clear all; close all; clc;

tspan = [0 10];

[t,y] = ode23(@(t,s) ...
    [s(2) + 4; -3 * s(1)], ...
    tspan, [2, 3]);

subplot(121)
plot(t,y)
axis tight
title("numerical solution")

%%

clear all; clc
syms x(t) z(t);
S = dsolve([ ...
    diff(x,t) == z + 4
    diff(z,t) == -3 * x
    ],[
     x(0) == 2
     z(0) == 3
    ]);
subplot(122)
fplot(S.x, [0, 10]); hold on;
fplot(S.z, [0, 10]); hold on;
title("analytical solution")
