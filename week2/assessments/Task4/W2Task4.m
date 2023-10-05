clear all; close all; clc

s = 100;
w = 3.835;
q = 1e-5;
f = 1.1;

x0 = 1;
y0 = 2;
z0 = 3;

ode = @(t, y) [s * (y(2) - y(1) * y(2) + y(1) - q * y(1)^2);
    (-y(2) - y(1) * y(2) + f * y(3)) / s;
    w * (y(1) - y(3))];

tspan = [0, 360];
[t, s] = ode23(ode, tspan, [x0, y0, z0]);

x = s(:, 1);
y = s(:, 2);
z = s(:, 3);

figure;
% plot(t, x, 'b', "LineWidth", 2);
% % hold on;
% plot(t, y, 'g');
% plot(t, z, 'r');
plot(t,s)
grid on;

figure;
plot3(x, y, z, 'b');
xlabel('x');
ylabel('y');
zlabel('z');
grid on