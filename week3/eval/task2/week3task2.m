clear; clc; clear all;

% Data
load('data_1.mat');

x = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15];
y = [0.0152663379168232	0.00817553721245885	0.0591597364781565	0.0895365108793846	0.249772336782089 0.504140626577991	0.730348940679816	0.873467611153355	0.987276703797050	0.999019273055022	0.968680408720015	1.03241543053049	0.963934753279030	0.998619093886553	0.985182352526284	1.02794139265005];

% Transforming data
logit_y = log(y./(1 - y));

% Matrix X
X = [ones(length(x), 1), x']; 

% Least squares
theta = X\logit_y';

% Individual parameters
theta0 = theta(1);
theta1 = theta(2);

% Display parameters
fprintf('Estimated Parameters:\n'); 
fprintf('Theta0: %.4f\n', theta0); 
fprintf('Theta1: %.4f\n', theta1); 

% Visualization
figure;
scatter(x, logit_y, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b'); 
hold on; 
plot(x, A * theta, 'r', 'LineWidth', 2); 
xlabel('x'); 
ylabel('logit(y)'); 
legend('Data', 'Fitted Model', 'Location', 'best'); 
title('Linear Least Squares Fit with Logit Transformation'); 
grid on;
