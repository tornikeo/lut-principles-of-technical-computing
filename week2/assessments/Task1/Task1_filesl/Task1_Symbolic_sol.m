s0 = [2; 3]; %initial values for x,z

syms x(t) z(t) %create symbolic functions
% system equations
eqns = [diff(x,t) == z+4, diff(z,t) == -3*x];
% initial conditions
conds = [x(0) == s0(1), z(0) == s0(2)];
% Solve the system
[S_x, S_z] = dsolve(eqns, conds);
% plot the solution
figure;
fplot(S_x, [0 10])
hold on
fplot(S_z, [0 10])
title('Task1ODE Symbolically')