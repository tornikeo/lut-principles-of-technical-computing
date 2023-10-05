clear all;
close all;
clc

% Define symbolic variables and parameters / 
% Määritetään symboliset muuttujat ja parametrit
s0 = [1 0 0]; % Initial values for A, B
k1 = 0.06;   % Model parameter / Malliparametri
k2 = 0.03;   % Model parameter / Malliparametri

syms A(t) B(t) % Create symbolic functions / Luodaan symboliset funktiot

% System equations /
% Differentiaaliyhtälöt
eqns = [diff(A, t) == -k1 * A, diff(B, t) == k1 * A - k2 * B];

% Initial conditions
% Alkuolosuhteet
conds = [A(0) == s0(1), B(0) == s0(2)];

% Solve the system symbolically /
% Ratkaistaan järjestelmä symbolisesti
[S_A(t), S_B(t)] = dsolve(eqns, conds);

% Create a time vector for plotting /
% Luodaan aikavektori kaavioita varten
t_values = linspace(0, 60);

% Evaluate the symbolic solutions at specific time points/
% Arvioidaan symbooliset ratkaisut tietyssä ajankohdassa 
A_values = double(subs(S_A, t, t_values));
B_values = double(subs(S_B, t, t_values));


% Plot the solutions
figure;

subplot(3, 1, 1);
plot(t_values, A_values);
xlabel('Time/Aika');
ylabel('Concentration/Lääkepitoisuus (mg)');
title('Stomach/Mahassa(t)');

subplot(3, 1, 2);
plot(t_values, B_values);
xlabel('Time/Aika');
ylabel('Concentration/Lääkepitoisuus (mg)');
title('Blood/Veressä(t)');
