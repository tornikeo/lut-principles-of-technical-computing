clear all; close all;clc;
% Script file for fitting the ODE model in ClassExerscise task 4

load('ODE1_data.mat')

data.time=t;%time data
data.ydata=y;%response data for Y and Z
data.s0    = [1 2 3]; % intial condition      
theta0=[10 30 7 ];%Initial guess


[theta_opt, ssmin] = fminsearch(@ODE1_ss,theta0,[],data);%call the optimizer


[t,s] = ode23(@ODE1_fun,t,data.s0,[],theta_opt);%evaluate your model using the optimized parameter values

figure;
plot(data.time,data.ydata,'o',t,s) %plot the data vs solution
grid on













