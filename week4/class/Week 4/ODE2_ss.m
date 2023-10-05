function ss = ODE2_ss(params,data)
%INPUT teta, data
%OUTPUT ss (lsq) value
t = data.time;%time points
y_obs = data.ydata; %data for prey population N_p
s0=data.s0;%initial conditions needed by the ODE solver

%call the ODE solver to get the states s:
[t,s] = ode23s(@ODE2_fun,t,s0,[],params);
y_cal = s(:,1); %separate the measured Np
%compute the expression to be minimized:
ss= sum((y_obs-y_cal).^2);
