clear all; close all;

% Script file to run the ODE simulation for x->z
tspan = [0 10]; % time interval
S0 = [2,3]; % initial values for x,z
[t,s] = ode23(@Task1ODE, tspan, S0); % Using the MATLAB ODE solver 'ODE 23'
% Inputs: Task1ODE is the name of m-file and also the function name, where the ODE is given
% tspan is the time interval in which we want the solution
% S0 is the initial values at time t=0
% Outputs: t is the time point where solution is presented, s is the solution matrix
figure; % to get the graphical presentation
plot(t,s); % plotting the solution
title('Task 1 ODE'); % to give a title to the figure
