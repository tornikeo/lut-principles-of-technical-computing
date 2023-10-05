clear all; close all;

%SCRIPT file to run the ODE simulation for A->B->C.
s0 = [1 0 0]; %initial values for A,B,C
tspan = [0,10]; %time interval
%k1 = 0.7; %model parameter
%k2 = 0.2; %model parameter
k=[0.7 0.2];
% Call of the MATLAB ODEsolver 'ode23':
opts=odeset('RelTol',1e-8,'Stats','on');
[t,s] = ode23(@myfirstode,tspan,s0,opts,k);
%inputs: myfirstode the name of the m-file, where the
% ODE is given
% tspan time interval where solution wanted
% s0 initial values at time t=0
% [] options, empty: not used here
% k1,k2 model parameters used in 'myfirstode'
%outputs: t the time points where solution presented,
% s the solution matrix
figure; hold on
%plot(t,s) % plot the solution
%plot(t,s(:,1),'r',t,s(:,2),'b',t,s(:,3),'k')
plot(t,s(:,1),'r')
plot(t,s(:,2),'b')
plot(t,s(:,3),'k')
legend('A','B','C')

%% Solving with Symbolic Math Toolbox

s0 = [1 0 0]; %initial values for A,B,C
k1 = 0.7; %model parameter
k2 = 0.2; %model parameter
syms A(t) B(t) C(t) %create symbolic functions
% system equations
eqns = [diff(A,t) == -k1*A diff(B,t) == k1*A - k2*B...
diff(C,t) == k2*B];
% initial conditions
conds = [A(0) == s0(1); B(0) == s0(2); C(0) == s0(3)];
% Solve the system
S= dsolve(eqns, conds);
% plot the solution
figure
fplot(S.A, [0 10])
hold on
fplot(S.B, [0 10])
fplot(S.C, [0 10])

