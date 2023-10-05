function ss = ABCDE_ss(params,s0,data)
%INPUT teta, the unknowns k1,k2
% s0, data the constants needed:
% s0 initial values needed by the ODE solver
% data(:,1) time points
% data(:,2) responses: B values
%OUTPUT ss (lsq) value
t = data(:,1);%time points
y_obs = data(:,2); %data for concentration of A

%call the ODE solver to get the states s:
[t,s] = ode23(@ABCDE_ODE,t,s0,[],params);
%the ODE system in ’ABCDE_ODE’ is just as before
%at each row (time point), s has
%the values of the components [A,B,C,D, E,F]
y_cal = s(:,1); %separate the measured A
%compute the expression to be minimized:
ss= sum((y_obs-y_cal).^2);
