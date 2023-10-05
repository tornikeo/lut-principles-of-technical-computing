clear all; close all;clc;
%This script file runs the ODE system in Class Exrecise 2


s0    = [40 9]; % intial condition      
tspan = [0, 100]; %time interval


[t,sol] = ode45(@ODE2_fun,tspan,s0,[]);%ODE call

figure;
plot(t,sol(:,1),'--b', t,sol(:,2),'--r')
grid on


%% Using Symbolic MathToolbox

s0 = [4 9]; %initial values for Np and Nh

syms Np(t) Nh(t) %create symbolic functions
% system equations
eqns = [diff(Np,t) == 0.1*Np-0.005*Np*Nh diff(Nh,t) == -0.02*Nh+0.001*Np*Nh];
% initial conditions
conds = [Np(0) == s0(1); Nh(0) == s0(2)];
% Solve the system
[S_Np, S_Nh] = dsolve(eqns, conds)
% plot the solution
figure
fplot(S_Np, [0 100])
hold on
fplot(S_Nh, [0 100])

%NOTE that no symbolic solution was found for this example



