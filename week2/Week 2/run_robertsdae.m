clear all; close all; clc
%This code runs the RobertsDAE

y0 = [1; 0; 0];
tspan = [0 1000000];
M = [1 0 0; 0 1 0; 0 0 0];
options = odeset('Mass',M,'RelTol',1e-4,'AbsTol',[1e-6 1e-10 1e-6]);
[t,y] = ode15s(@robertsdae,tspan,y0,options);

y(:,2) = 1e4*y(:,2);% scale up the second column of solutions
% to get visualise the plot on a comparable scale
semilogx(t,y);% plot on a log scale...suitable for data with a wide range of values
ylabel('1e4 * y(:,2)');
title('Robertson DAE problem with a Conservation Law, solved by ODE15S');