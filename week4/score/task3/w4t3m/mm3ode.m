clear all; close all; clc;

%A(0)=1.0
%B(0)=0
%C(0)=0
% for commands to call FMINSEARCH optimizer

% R = 8.314
% T = 282K & T = 313K
% Tref = 300K

k1 = 282 ; 
k2 = 313 ;
teta = [k1 k2] ;
if T==k1
    ydata=[0 1.000 0.000
    1 0.504 0.416
    2 0.186 0.489
    3 0.218 0.595
    4 0.022 0.506
    5 0.102 0.493
    6 0.058 0.458
    7 0.064 0.394
    8 0.000 0.335
    9 0.082 0.309] ;
end
if T==k2
    ydata_=[0 1.000 0.000
    1 0.415 0.518
    2 0.156 0.613
    3 0.196 0.644
    4 0.055 0.444
    5 0.011 0.435
    6 0.000 0.323
    7 0.032 0.390
    8 0.000 0.149
    9 0.079 0.222] ;
end
t = [0:1:9];
y = ydata(:,2);
data = [t y];
so = [1 0 0];
teta_opt = fminsearch(@mm3lsg,teta,[],s0,data);
k1 = teta_opt(1);
k2 = teta_opt(2);
[t,s] = ode23(@mm3ode,t,s0,[],k1,k2);
plot(t,y,'o',t,s)

function lsq = mm3lsq(teta,s0,data)
t = data(:,1);
y_obs = data(:,2);
k1 = teta(1); 
k2 = teta(2);
[t,s] = ode(@mm3ode,t,s0,[],k1,k2);
y_cal = s(:,2);
lsq= sum((y_obs-y_cal).^2)
end


