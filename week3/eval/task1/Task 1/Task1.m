y = [26.5, 57.9, 108.4, 155.9, 209.3, 272.4, 384.3];
x1 = [2.1, 4.3, 7.0, 9.1, 10.5, 12.7, 15.2];
x2 = [10.4, 15.5, 21.0, 24.9, 30.3, 33.8, 41.4];

X = [ones(length(x1), 1), x1', x2', x1' .* x2'];

theta_opt = X \ y';

y_pred = X * theta_opt;

scatter3(x1, x2, y, 'filled', 'MarkerEdgeColor', 'k');
hold on;

[x1_mesh, x2_mesh] = meshgrid(min(x1):0.1:max(x1), min(x2):0.1:max(x2));
y_mesh = theta_opt(1) + theta_opt(2) * x1_mesh + theta_opt(3) * x2_mesh + theta_opt(4) * x1_mesh .* x2_mesh;
surf(x1_mesh, x2_mesh, y_mesh, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xlabel('x1');
ylabel('x2');
zlabel('y');
title('Linear Regression Fit Task 1');
grid on;
hold off;