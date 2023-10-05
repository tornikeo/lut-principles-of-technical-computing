clc
clear all
close all

% Task 3. 
% s'(t) = -ksx/(k_s + s)
% x'(t) = y*[ksx/(k_s + s)] - bx
% k = 5 (1/T), k_s = 20 (Mol/L^3), y = 0.05, b = 0.01
% s(0) = 2000, x(0) = 100

pekka = [5 20 0.01 0.05];
jarkko = [2000 100];
tspan = [0 10];
[t,s] = ode23(@task3ode,tspan,jarkko,[],pekka);

figure
plot(t, s(:,1), 'b', 'LineWidth', 2)
hold on
plot(t, s(:,2), 'r', 'LineWidth', 2)
title('Bioreaction kinetics')
xlabel('Time (t)'); ylabel('Mol/L^3')
legend('Growth limiting substrate concentration', 'Biomass concentration')


function ds = task3ode(t,s,k)

% Variables
S = s(1);
X = s(2);

% Parameters
K = k(1);
K_s = k(2);
B = k(3);
Y = k(4);

% Equations
Ds = (-K*S*X)/(K_s+S);
Dx = Y*((K*S*X)/(K_s+S))-B*X;

% Results
ds = [Ds;Dx];
end

