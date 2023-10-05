% Script file for fitting the beer model
clear all; close all; clc;

t=[0:60:540 840 1020 1320];%time
y=[31 28 24 20 17.5 15.5 13.5 12 11 10 8 7 6.5];%Temperatur of beer with time
data=[t' y']; %collect the data in a matrix; to pass into fminsearch call

k1k2_0=[0.01 0.01];   % initial guess for the parameters

Ta=23; %temperature of air
Tw=5;  %temperature of water
T0=31; %Initial temperature of beer

% plot the initial fit with the initial guess of parameters
[t,Tinit]=ode45(@beerode,t,T0,[],k1k2_0,Ta,Tw);%call the ODE solver
plot(t,Tinit,t,y,'o');

% Call the optimizer
opts=optimset('Display','iter');%option set for optimizer
[thopt,ssopt]=fminsearch(@beerss,k1k2_0,opts,data,T0,Ta,Tw);







