clear all; close all; clc;

t=[0 60 120 180 240 300 360 420 480 540 840 1020 1320]';
T=[31 28 24 20 17.5 15.5 13.5 12 11 10 8 7 6.5]';
TT=[t T];

data.xdata=TT(:,1);
data.ydata=TT(:,2);

fun = @(theta,x) (31-(theta(1)*5+theta(2)*23)/(theta(1)+theta(2)))*exp(-theta(1)-theta(2)*x)+(theta(1)*5+theta(2)*23)/(theta(1)+theta(2));

ssfun = @(theta,data) sum((data.ydata-fun(theta,data.xdata)).^2);

% minimize ssfun using 'fminsearch'.
th_init = [0.001 0.0001]; 
[thmin,ssmin] = fminsearch(ssfun,th_init,[],data);

%yfit=fun(data.xdata,thmin);
yfit=fun(thmin,data.xdata);

figure(1);
plot(data.xdata,data.ydata,'o',data.xdata,yfit,'r')
grid on
xlabel('time')
ylabel('temp (◦C)')