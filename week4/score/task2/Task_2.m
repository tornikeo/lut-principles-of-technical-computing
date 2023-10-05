% Load the data from data_8.mat or provide your own data
% Assuming you have xdata and ydata loaded from your dataset
% load('data_8.mat');
x = [0;2;4;7;9;10];
yr = [0.775191293313970;29.901045174207370;7.358099321457987e+02;208;1.697974452174200;1.539484676153329];

% Fit a second-degree polynomial using polyfit and polyval
poly_coefficients = polyfit(x, yr, 2);
poly_fit = polyval(poly_coefficients, x);

% Fit an exponential model by log-transforming and using linear least squares (LLS)
log_ydata = log(yr);
A = [ones(size(x)), x, x.^2];
params = A \ log_ydata;

% Extract parameters for exponential model
b0 = params(1);
b1 = params(2);
b2 = params(3);

% Create the exponential model
exp_fit = exp(b0 + b1 * x + b2 * x.^2);

% Plot the original data, polynomial fit, and exponential fit
figure;
plot(x, yr, 'bo', 'DisplayName', 'Data');
hold on;
plot(x, poly_fit, 'r-', 'LineWidth', 2, 'DisplayName', 'Second-Degree Polynomial Fit');
plot(x, exp_fit, 'g-', 'LineWidth', 2, 'DisplayName', 'Exponential Fit');
xlabel('x');
ylabel('yr');
title('Fitting Data with Polynomial and Exponential Models');
legend('Location', 'best');
grid on;
hold off;

% Define a nonlinear fitting function for fminsearch
nonlinear_fit = @(params) sum((exp(params(1) + params(2) * x + params(3) * x.^2) - yr).^2);

% Perform nonlinear fitting with fminsearch using initial parameters from LLS
initial_params = [b0, b1, b2];
optimal_params = fminsearch(nonlinear_fit, initial_params);

% Extract the optimized parameters
optimal_b0 = optimal_params(1);
optimal_b1 = optimal_params(2);
optimal_b2 = optimal_params(3);

% Create the final exponential model using optimized parameters
final_exp_fit = exp(optimal_b0 + optimal_b1 * x + optimal_b2 * x.^2);

% Plot the final exponential fit
figure;
plot(x, yr, 'bo', 'DisplayName', 'Data');
hold on;
plot(x, final_exp_fit, 'm-', 'LineWidth', 2, 'DisplayName', 'Final Exponential Fit');
xlabel('x');
ylabel('yr');
title('Final Exponential Fit');
legend('Location', 'best');
grid on;
hold off;

% Display the optimized parameters for the exponential model
fprintf('Optimal b0: %.4f\n', optimal_b0);
fprintf('Optimal b1: %.4f\n', optimal_b1);
fprintf('Optimal b2: %.4f\n', optimal_b2);