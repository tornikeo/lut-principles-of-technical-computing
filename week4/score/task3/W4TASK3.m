clear all; close all; clc;

% Given data for T = 282K
data_T1 = [0 1.000 0.000;
             1 0.504 0.416;
             2 0.186 0.489;
             3 0.218 0.595;
             4 0.022 0.506;
             5 0.102 0.493;
             6 0.058 0.458;
             7 0.064 0.394;
             8 0.000 0.335;
             9 0.082 0.309];

% Given data for T = 313K
data_T2 = [0 1.000 0.000;
             1 0.415 0.518;
             2 0.156 0.613;
             3 0.196 0.644;
             4 0.055 0.444;
             5 0.011 0.435;
             6 0.000 0.323;
             7 0.032 0.390;
             8 0.000 0.149;
             9 0.079 0.222];

% Reference temperature and known parameters
Tref = 300; % Reference temperature in Kelvin
R = 8.314;  % Gas constant
S0 = [1 0];
T1= 282;
T2= 313;
% Initial guess for parameters (k1_ref, E1, k2_ref, E2)
initial_theta = [1, 1e4, 1, 1e4];
p1 = 1;
p2 = 2;
% Perform LSQ estimation for parameters for Data at T282
options = optimset('MaxFunEvals', 1000);
est_theta_T1 = fminsearch(@fit_model, initial_theta, options, data_T1,Tref, R, T1 ,p1);

% Extract estimated parameters
k1_ref_T1 = est_theta_T1(1);
E1_T1 = est_theta_T1(2);
k2_ref_T1 = est_theta_T1(3);
E2_T1 = est_theta_T1(4);


% Perform LSQ estimation for parameters for Data at T313
options = optimset('MaxFunEvals', 1000);
est_theta_T2 = fminsearch(@fit_model, initial_theta, options, data_T2,Tref, R, T2, p2);

% Extract estimated parameters
k1_ref_T2 = est_theta_T2(1);
E1_T2 = est_theta_T2(2);
k2_ref_T2 = est_theta_T2(3);
E2_T2 = est_theta_T2(4);

% Simulate the model for both temperatures using estimated parameters
t = data_T1(:, 1); % Time values

% Calculate reaction rates using Arrhenius equation at T282
k1_T1 = k1_ref_T1 * exp((E1_T1 / R) * (1 / 282 - 1 / Tref));
k2_T1 = k2_ref_T1 * exp((E2_T1 / R) * (1 / 282 - 1 / Tref));

% Calculate reaction rates using Arrhenius equation at T313
k1_T2 = k1_ref_T2 * exp((E1_T2 / R) * (1 / 313 - 1 / Tref));
k2_T2 = k2_ref_T2 * exp((E2_T2 / R) * (1 / 313 - 1 / Tref));


% Simulate the ODE system for both temperatures
[t yfit] = ode23(@odeABC, t, S0,[], k1_T1, k2_T1);
[t yfit2] = ode23(@odeABC, t, S0,[], k1_T2, k2_T2);


% Plot the results

% Setting the position and deminension of the figure 
newPosition = [100, 100, 1200, 500]; 
set(gcf, 'Position', newPosition);

subplot(1, 2, 1);
plot(t, yfit,t, data_T1(:, 2), 'ok',t, data_T1(:, 3), 'ob', 'LineWidth', 2); hold on;
legend('Model A','Model B','A','B','Location', 'Best');
title('T = 282K');

subplot(1, 2, 2);
plot(t, yfit2,t, data_T2(:, 2), 'ok',t, data_T2(:, 3), 'ob', 'LineWidth', 2); hold on;
legend('Model A','Model B','A','B','Location', 'Best');
title('T = 313');


% ODE system equations
function dydt = odeABC(t, y, k1, k2)
    dydt = [-k1 * y(1); 
            k1 * y(1) - k2 * y(2)];
end

% Objective function for least-squares estimation
function ss = fit_model(params, data, Tref, R, T,p)
    k1_ref = params(1);
    E1 = params(2);
    k2_ref = params(3);
    E2 = params(4);
    t = data(:, 1); % Time values
    A_data = data(:, 2);
    B_data = data(:, 3);
    % Calculate reaction rates using Arrhenius equation
    k1t1 = k1_ref * exp((E1 / R) * (1 / T - 1 / Tref));
    k2t1 = k2_ref * exp((E2 / R) * (1 / T - 1 / Tref));
    
    % Simulate the ODE system
    [t, yfit] = ode23(@odeABC, t, [1; 0], [], k1t1, k2t1);
    
    % Calculate error by comparing each time point of the simulation with data
    error_A = A_data - yfit(:, 1);
    error_B = B_data - yfit(:, 2);
    
    % Sum of squared errors
    ss = sum(error_A.^2) + sum(error_B.^2);
% Setting the position and deminension of the figure 
newPosition = [100, 100, 1200, 500]; 
set(gcf, 'Position', newPosition);
subplot(1, 2, p);
plot(t, yfit,t, data(:, 2), 'ok',t, data(:, 3), 'ob', 'LineWidth', 2); 
subplot(1, 2, p);
plot(t, yfit,t, data(:, 2), 'ok',t, data(:, 3), 'ob', 'LineWidth', 2);
pause(0.005)
end
