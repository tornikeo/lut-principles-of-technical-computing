clear all;
clc;
close all;

% Define values of 'a' getting close to 1
a_values = [0.9, 0.99, 0.999, 0.9999];

% Initialize the unit circle points
t = linspace(0, 2 * pi, 100);
x_unit_circle = cos(t);
y_unit_circle = sin(t);

% Create a figure for visualization
figure;
hold on;
scatter(x_unit_circle, y_unit_circle, 'b'); % Plot the unit circle

% Loop through the specified values of 'a'
for i = 1:length(a_values)
    a = a_values(i);

    % Create the matrix A = [1, a; a, 1]
    A = [1, a; a, 1];

    % Transform the unit circle using the matrix A
    transformed_circle = A * [x_unit_circle; y_unit_circle];

    % Plot the transformed circle
    scatter(transformed_circle(1, :), transformed_circle(2, :), 'r');
    plot([0, transformed_circle(1, 1)], [0, transformed_circle(2, 1)], 'r-o', 'LineWidth', 2);
    
    % Add a legend entry with the corresponding 'a' value
    legend_labels{i} = ['a = ' num2str(a)];
end

hold off;
grid on;
axis equal;
title('Mapping the Unit Circle with A = [1, a; a, 1]');
xlabel('X-axis');
ylabel('Y-axis');
legend(['Unit Circle', legend_labels]);
