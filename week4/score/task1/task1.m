% Task 1
clear; close all; clc

% The data
data.t_meas = [0:60:540 840 1020 1320]'; % time
data.T_meas = [31 28 24 20 17.5 15.5 13.5 12 11 10 8 7 6.5]'; % temperature

T0 = 31;
Ta = 23;
Tw = 5;
 
% The model function
fun = @(k,t) (T0-(k(1)*Tw+k(2)*Ta)/(k(1)+k(2)))*exp(-(k(1)+k(2))*t...
    +(k(1)*Tw+k(2)*Ta)/(k(1)+k(2))); 


ssfun = @(k,data) sum((data.T_meas-fun(k,data.t_meas)).^2); % ss function

% Then minimize ssfun using 'fminsearch'.

k0 = [0.001  0.0001]; % initial guesses
[thmin, ssmin] = fminsearch(ssfun,k0,[],data);

yfit=fun(thmin,data.t_meas);

figure;
plot(data.t_meas,data.T_meas,'o',data.t_meas,yfit);
xlabel('time');
ylabel('temperature');



