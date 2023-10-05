clear all, clc, close ;
% Scipt file to run the ODE
initial_conditions = [
    2000;
    100;
    ];
tspan = [0,40];
k = 5;
k_s = 20;
y = 0.05;
b = 0.01;
[t,s] = ode23(@ODE_fun3, tspan, initial_conditions, [], k, k_s, y, b);

figure;
plot(t,s);
title('Numeric Solution')
%plot the solution


%% input
function ds = ODE_fun3(t,params,k,k_s,y,b);
s = params(1);
x = params(2);

% The ODE system eqn
DX1 = -(k*s*x)/(k_s+s);
DX2 = (y*(k*s*x)/(k_s+s)-b*x);
ds = [DX1;DX2];
% Collect the output of vector dr
end


