clear all; close all;clc;
% Script file for fitting the nonlinear model in ClassExerscise task 6
load('ODE2_data.mat')

data.time=t;%time data
data.ydata=y;%response data for N_p
data.s0    = [40 9]; % intial condition      

theta0=[0.2 0.025 0.02 0.01];%initial guess
%theta0=[0.21 0.025 0.2 0.01];%wrong initial guess


[theta_opt, ssmin] = fminsearch(@ODE2_ss,theta0,[],data);%call the optimizer

[t,s] = ode23s(@ODE2_fun,t,data.s0,[],theta_opt);%evaluate your model using the optimized parameter values

figure;
plot(data.time,data.ydata,'o',t,s) %plot the data vs solution
grid on





