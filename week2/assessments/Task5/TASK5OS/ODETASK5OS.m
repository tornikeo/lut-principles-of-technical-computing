%Task5 Olli Soramies

clc, clear; close all;

%solving numerically


% Define the initial conditions

z0 = 2;
y0 = 0.99005;

s0 = [z0 y0];

tspan = [0 1];


options = odeset('RelTol',1e-8,'Stats','on');

[t,y] = ode15s(@ODETASK5_f_OS,tspan,s0,options);



figure(1); hold on


%plot(t,y) % plot the solution

plot(t,y(:,1),'r')
plot(t,y(:,2),'b')
grid on
legend('y1', 'y2')

