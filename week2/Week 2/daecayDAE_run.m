clear all; close all; clc;

%Script file to run the DAE simulation for the radioactive decay ODE A->
%with an algebraic equation c = qA + rB (Class Exercise 3)

s0=[1 0]; %initial values for A
tspan =[0,20]; %time interval
p=  [0.1386 1 2 3]; %model parameter (decay rate)
M = [1 0 ; 0 0];%define the mass matrix
opts = odeset('Mass',M);%options for the solver
[t,s] = ode15s(@decayDAE,tspan,s0,opts,p);%solve here

figure;
plot(t,s) % plot the solution
grid on