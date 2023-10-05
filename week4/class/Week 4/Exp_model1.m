clear all; close all; clc
% Script file for fitting the nonlinear model in ClassExerscise task 2
load data_1.mat %load('data_1.mat') 


data.xdata = xy(:,1);  
data.ydata = xy(:,2);

%%
% Generally, we write the codes for modelling and statistics
% in separate m-files. For simple cases, both are easy
% to write as one line anonymous functions using the @ construct:

%fun = @(x,theta) 1./(1+exp(-(theta(1)+theta(2)*x)));  %define the model function   
fun = @(theta,x) 1./(1+exp(-(theta(1)+theta(2)*x)));  %define the model function 

%ssfun    = @(theta,data) sum((data.ydata-fun(data.xdata,theta)).^2); % ss function
ssfun    = @(theta,data) sum((data.ydata-fun(theta,data.xdata)).^2); % ss function

% Then minimize ssfun using 'fminsearch'.

th_init = [1 0.15]; % ... after some trial & error, by plotting various options
[thmin,ssmin] = fminsearch(ssfun,th_init,[],data);

%yfit=fun(data.xdata,thmin);
yfit=fun(thmin,data.xdata);

figure;
plot(data.xdata,data.ydata,'o',data.xdata,yfit)

%% Use the least square curve fit function (lscurvefit)
%lscurvefit computes the sum of square implicitly ....sum {(FUN(THETA,XDATA)-YDATA).^2}
% note from the above that the model function inputs must be given in the
% order (theta,xdata) unlike in fminsearch where you can be flexible with
% the order for the model function.

[thmin_,ssmin_] = lsqcurvefit(fun,th_init,data.xdata,data.ydata);

yfit_=fun(thmin_,data.xdata);

figure;
plot(data.xdata,data.ydata,'o',data.xdata,yfit_)



