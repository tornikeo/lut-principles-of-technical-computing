clear all; close all; clc;

k = 5;
ks = 20;
y = .05;
b = .01;
% [t,x] = ode45(@(t,x) [ ...
%         - (k * x(1) * x(2)) / (ks + x(1));
%         y * (k * x(1) * x(2)) / (ks + x(1)) - b * x(2);
%     ], [0 40], [2000, 100], odeset('Stats','on'));
% 
% subplot(121)
% plot(t,x, '-x'); hold on
% axis tight
% legend s x
% title("numerical solution")


[t,x] = ode23(@(t,x) [ ...
        - (k * x(1) * x(2)) / (ks + x(1));
        y * (k * x(1) * x(2)) / (ks + x(1)) - b * x(2);
    ], [0 40], [2000, 100], odeset('Stats','on'));

% subplot(121)
plot(t,x)
axis tight
legend s x
title("numerical solution")

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
