clear; close all; clc;

% Data
X = [5 7 11 12 15 17 19]';
Y_init = [0.93 0.91 0.84 0.82 0.76 0.71 0.66];
Y = log(1 ./ [0.93 0.91 0.84 0.82 0.76 0.71 0.66]'); % Taking natural logarithm

% Define the coefficient matrix
XX = [ones(size(X)) X.^2];

% Estimate the parameters using linear least squares
params = XX\Y;
theta1 = params(1);
theta2 = params(2);

% Get the fitted values
Yfit = 1./(exp(theta1 + theta2 * X.^2));

% Plot data and fitted values
figure;
plot(X, Y_init, 'o', X, Yfit);
title('Model Fit');
xlabel('x');
ylabel('ln(y)');
legend('Data', 'Fitted Values');
grid on;

% Display the estimated parameters
disp(['Estimated theta1: ' num2str(theta1)]);
disp(['Estimated theta2: ' num2str(theta2)]);
