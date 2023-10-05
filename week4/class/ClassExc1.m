clear all; close all; clc;

data.time = [0 60 120 180 240 300 360 420 480 540 840 1020 1320]; % Second
data.temperature = [31 28 24 20 17.5 15.5 13.5 12 11 10 8 7 6.5]; % Celsius

T_water = 5; % Celsius
T_air = 23; % Celsius
k1 = 1;
k2 = 2; 

[t,s] = ode23(@beer_temp_ode, data.time, data.temperature(1), [], T_air, T_water, k1, k2);

plot(t,s)
plot()
% Need: theta = [k1, k2]
% dT/dt = -k1 * ( T - T_water ) - k2 * ( T - T_air )

function ds = beer_temp_ode(time, T, T_air, T_water, k1, k2)
    ds = -k1 * (T - T_water) - k2 * (T - T_air);
end