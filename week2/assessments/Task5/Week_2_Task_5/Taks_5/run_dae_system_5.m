clc
close all
clear 
z0 = [2; 0.99005]; %initial conditions

tspan = [0, 10]; % time span

% Call the ODE solver
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);
[t, Z] = ode15s(@dae_system_5, tspan, z0, options);

% solutions for z and y
z_solution = Z(:, 1);
y_solution = Z(:, 2);

% Plot the solutions
figure;
subplot(2, 1, 1);
plot(t, z_solution,'r','LineWidth',1);
xlabel('Time');
ylabel('z');
title('Solution for z');
grid on

subplot(2, 1, 2);
plot(t, y_solution,'b','LineWidth',1);
xlabel('Time');
ylabel('y');
title('Solution for y');
grid on

%Display the final values of z and y
final_z = z_solution(end);
final_y = y_solution(end);
disp(['Final z: ', num2str(final_z)]);
disp(['Final y: ', num2str(final_y)]);
