clear all; close all; clc;

s = 100;
w = 3.835;
q = 1e-5;
f = 1.1;
[t,x] = ode45(@(t,x) [
        s * (x(2) - x(1) * x(2) + x(1) - q * x(1)^2);
        (-x(2) - x(1) * x(2) + f * x(3)) / s;
        w * (x(1) - x(3));
    ], [0 360], [1,2,3], odeset('Stats','on'));

subplot(121)
plot(t,x)
axis tight
title("numerical solution (2d)")
subplot(122)
plot3(x(:,1), x(:,2), x(:,3))
axis tight
title("numerical solution (3d)")
% function result = func(t,s,)
% analytical
% syms s(t) x(t)
% S = dsolve([ ...
%         diff(s, t) == - (k * s * x) / (ks + s);
%         diff(x, t) ==  y * (k * s * x) / (ks + s) - b * x;
%     ], [ ...
%         s(0) == 2000
%         x(0) == 100
%     ]);
% 
% subplot(122)
% fplot(S.s, [0, 100]); hold on;
% fplot(S.x, [0, 100]); hold on;
% title("analytical solution")
