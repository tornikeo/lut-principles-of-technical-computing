clear all; close all;

s0 = [0 0];
tspan = [0,300]; 
k = [0.06 0.03 4];

%%  Numerically
% opts=odeset('RelTol',1e-8,'Stats','on');
[t, s] = ode23(@DE_2, tspan, s0, [],  k);

%% Symbolic Math Toolbox
% syms x1(t) x2(t) 
% 
% a = 4;
% eqns = [diff(x1, t) == -k(1)*x1 + a diff(x2, t) == -k(1)*x1 - k(2)*x2 + a];
% conds = [x1(0) == s0(1); x2(0) == s0(2)];
% 
% S = dsolve(eqns, conds);

%% 
% Run ODE numerical solve in case of error
figure; hold on
plot(t, s(:, 1), 'r')
plot(t, s(:, 2), 'b')
legend('x1', 'x2')
hold off 
% 
% figure
% fplot(S.x1, [0 300])
% hold on
% fplot(S.x2, [0 300])
% hold off
