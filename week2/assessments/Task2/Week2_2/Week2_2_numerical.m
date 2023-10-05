clear all; close all;
% Define parameters / 
% määritetään parametrit
k1 = 0.06;
k2 = 0.03;
a = 4; % Drug ingestion rate in mg/min / 
% lääkkeen nielemistnopeus mg/min

% Define the system of differential equations
dx1dt = @(t, x1, x2) -k1 * x1 + a;
dx2dt = @(t, x1, x2) -k1 * x1 - k2 * x2 + a;

% Initial conditions / 
% Alkuolosuhteet
x1_0 = 0;
x2_0 = 0;

% Time span /
% Aikaväli (60min)
tspan = [0, 60]; 

% Define the system as a function for ode45 /
% Määritetään differentiaaliyhtälöjärjestelmä funktiona ode45
odefun = @(t, y) [dx1dt(t, y(1), y(2)); dx2dt(t, y(1), y(2))];

% Initial conditions as a column vector /
% Alukoolosuhteet sarake vektorina
initial_conditions = [x1_0; x2_0];

% Solve the system numerically
% Ratkaistaan numeerisesti
[t, y] = ode45(odefun, tspan, initial_conditions);

% Extract the concentrations
% Puretaan pitoisuudet
x1 = y(:, 1);
x2 = y(:, 2);

% Plot the concentrations over time/
% Esitetään tulos ajan suhteen
figure;
plot(t, x1, 'b', t, x2, 'r');
xlabel('Time/Aika (min)');
ylabel('Concentration/Lääkepitoisuus (mg)');
legend('Blood/Veressä (x1)', 'Stomach/Vatsassa (x2)');
title('Drug Concentrations/Lääkepitoisuus vs. Time/Aika');