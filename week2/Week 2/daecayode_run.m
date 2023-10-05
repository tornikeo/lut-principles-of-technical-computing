clear all; close all; clc;

%Script file to run the ODE simulation for the radioactive decay ODE A->

s0=1; %initial values for A
tspan =[0,20]; %time interval
k=  0.1386; %model parameter (decay rate)

[t,s] = ode23(@decayode,tspan,s0,[],k);

figure;
plot(t,s) % plot the solution
grid on

% checking time for half-life
yline(0.5);% checking time for half-life

t_halflife=interp1(s,t,0.5)
% s contains the sample points ...decay solution w.r.t time
% t gives is the corresponding time points
% 0.5 is the query point



