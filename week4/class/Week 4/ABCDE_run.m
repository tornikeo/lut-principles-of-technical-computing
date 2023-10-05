clear all; close all; clc;

%SCRIPT file for commands to call FMINSEARCH optimizer for ABCDE_ODE (Class Exercise 1)

ts_data=[4.50 15.40
8.67 14.22
12.67 13.35
17.75 12.32
22.67 11.81
27.08 11.39
32.00 10.92
36.00 10.54
46.33 9.780
57.00 9.157
69.00 8.594
76.75 8.395
90.00 7.891
102.00 7.510
108.00 7.370
147.92 6.646
198.00 5.883
241.75 5.322
270.25 4.960
326.25 4.518
418.00 4.075
501.00 3.715];

t=ts_data(:,1);%sampling instants
ts_data(:,2)=ts_data(:,2)/1000; %converting the data (A) in moles/litre (std measure for the initial conditions)

y=ts_data(:,2);%data for the fitting, only concentration of A measured
params=[0.1, 0.2, 0.2];%initial guesses for k1,k2,k3 in one vector
s0 = [0.0209 1/3*0.0209 0 0 0 0]; %initial values for ODE

% Call the optimizer:
%param_opt = fminsearch(@ABCDE_ss,params,[],s0,data);
options = optimset('Display','iter','TolFun',1e-4,'TolX',1e-4,'MaxFunEvals',1000,'MaxIter',1000);%option set for optimizer
[param_opt,ssmin] = fminsearch(@ABCDE_ss,params,options,s0,ts_data);


%ODE solver called once more, to get the optimized solution
[t,s] = ode23(@ABCDE_ODE,t,s0,[],param_opt);
figure(1);
plot(t,y,'o',t,s) %plot the data vs solution
grid on


