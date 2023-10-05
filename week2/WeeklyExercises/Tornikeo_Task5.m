clear all; close all; clc;

%Script file to run the DAE simulation for the radioactive decay ODE A->
%with an algebraic equation c = qA + rB (Class Exercise 3)

s0=[2 .99005]; %initial values for A
tspan =[0,10]; %time interval
M = [1 0 ; 0 0];%define the mass matrix
opts = odeset('Mass',M,'Stats','on');%options for the solver
[t,s] = ode15s(@(t,s) [ ...
    -2 * s(1) + s(2)^2;
    2 * s(1) - 100 * log(s(2)) - 5;
    ],tspan,s0,opts); %solve here
figure;
plot(t,s) % plot the solution
grid on

%% Symbolic solution

% syms z(t) y(t)
% 
% eqns = [ ...
%     diff(z, t) == -2 * z + y ^ 2;
%     5 == 2 * z - 100 * log(y)
%     ];
% conds = [
%     z(0) == 2;
%     y(0) == .99005;
% ];
% vars = [z(t); y(t)];
% [eqns, vars] = reduceDifferentialOrder(eqns, vars);
% M = incidenceMatrix(eqns,vars);
% % [DAEs,DAEvars] = reduceDAEIndex(eqns,vars);
% [DAEs,DAEvars] = reduceRedundancies(eqns,vars);
% S = dsolve(DAEs, y(0) == .99005);
% fplot(S, [0 20]);
