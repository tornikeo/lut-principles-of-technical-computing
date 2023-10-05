% PTC2023, Week 4, Task 2
clc, clear, close all

% ---------------------- Data ------------------------
% load data_8.mat
x = [0;2;4;7;9;10];
yr = [0.775191293313970;29.901045174207370;7.358099321457987e+02;208;1.697974452174200;1.539484676153329];


data.xdata = x;
data.ydata = yr;

% -------- Fitting using polyfit and polyval ---------
p = polyfit(x,yr,2);
x1 = linspace(x(1),x(end));
y1 = polyval(p,x1);

% -------- Improve fit using log transform -----------
XX = [ones(size(x)) x x.^2];
YY = log(yr);

params = XX\YY;
b0 = params(1);
b1 = params(2);
b2 = params(3);

Yfit1 = exp(b0 + b1*x + b2*x.^2);

% -------- Improve fit using fminsearch --------------

% Defining functions
fun = @(b, x) exp(b(1) + b(2)*x + b(3)*x.^2);
ssfun = @(theta, data) sum((data.ydata-fun(theta,data.xdata)).^2);

theta0 = params; % Initial values for theta

% Then minimize ssfun using 'fminsearch'.
[thmin,ssmin] = fminsearch(ssfun,theta0,[],data);

Yfit2 = fun(thmin,data.xdata);


% ---------------- Visualizing the fit ---------------
figure("Name", "Week 4 - Task 2.","NumberTitle","off")
hold on
grid on
plot(x,yr,"o") % Data 
plot(x1,y1) % Polyfit 
plot(x,Yfit1) % Exponential form
plot(x,Yfit2) % fminsearch

legend("Data", "Polyfit","Log", "fminsearch")

