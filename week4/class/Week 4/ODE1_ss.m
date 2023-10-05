function ss = ODE1_ss(params,data)
%INPUT teta, data
%OUTPUT ss (lsq) value

t = data.time;%time points
y_obs = data.ydata; %data for  Y and Z
s0=data.s0;%initial conditions needed by the ODE solver
%call the ODE solver to get the states s:
[t,s] = ode23(@ODE1_fun,t,s0,[],params);
y_cal = s(:,2:end); %separate the measured Y and Z
%Compute the expression to be minimized:
ss= sum(sum((y_obs-y_cal).^2));
