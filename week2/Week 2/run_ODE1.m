clear all; close all;clc;

%This script file runs the ODE system in Class Exrecise 1

s0    = [1 2 3]; % intial condition      
tspan = [0,0.5]; %time interval


[t,sol] = ode45(@ODE1_fun,tspan,s0,[]);%ODE call

figure;
plot(t,sol(:,1),'--b', t,sol(:,2),'--r', t,sol(:,3),'--k')
grid on
legend('X','Y','Z')

%% Using Symbolic MathToolbox

s0 = [1 2 3]; %initial values for X,Y,Z

syms X(t) Y(t) Z(t) %create symbolic functions
% system equations
eqns = [diff(X,t) == X+2*Y-Z diff(Y,t) == X+Z diff(Z,t) == 4*X-4*Y+5*Z];
% initial conditions
conds = [X(0) == s0(1); Y(0) == s0(2); Z(0) == s0(3)];
% Solve the system
[S_X, S_Y, S_Z] = dsolve(eqns, conds)
% plot the solution
figure
fplot(S_X, [0 0.5])
hold on
fplot(S_Y, [0 0.5])
fplot(S_Z, [0 0.5])


