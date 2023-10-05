clear all; close all; clc;

k1 = .06;
k2 = .03;
a = 4;
[t,x] = ode23(@(t,x) [
        -k1 * x(1) + a;
        -k1 * x(1)  - k2 * x(2) + a;
    ],[0 300], [0, 0], []);

subplot(121)
plot(t,x)
axis tight
legend x1 x2
title("numerical solution")

% analytical
syms x1(t) x2(t)
[x1, x2] = dsolve([ ...
        diff(x1, t) == -k1 * x1 + a
        diff(x2, t) == -k1 * x1 - k2 * x2 + a
    ], [ ...
        x1(0) == 0
        x2(0) == 0
    ]);

subplot(122)
fplot(x1, [0, 300]); hold on;
fplot(x2, [0, 300]); hold on;

title("analytical solution")

% subplot(122)
% fplot(S.x, [0, 5]); hold on;
% fplot(S.z, [0, 5]); hold on;
% title("analytical solution")