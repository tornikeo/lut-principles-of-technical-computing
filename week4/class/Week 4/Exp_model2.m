clear all; close all; clc

% Script file for fitting the nonlinear model in ClassExerscise task 3
data.xdata = [5 7 11 12 15 17 19]'; % X(input) data
data.ydata = [0.93    0.91    0.84    0.82    0.76    0.71  0.66]'; % Y(response) data
% Generally, we write the codes for modelling and statistics
% in separate m-files. For simple cases, both are easy
% to write as one line anonymous functions using the @ construct:
 
fun = @(theta,x) 1./exp(theta(1)+theta(2)*x.^2); 

ssfun    = @(theta,data) sum((data.ydata-fun(theta,data.xdata)).^2); % ss function

% Then minimize ssfun using 'fminsearch'.

theta0 = [0.1  0.5]; % ... after some trial & error, by plotting various options
[thmin, ssmin] = fminsearch(ssfun,theta0,[],data);

yfit=fun(thmin,data.xdata);

figure;
plot(data.xdata,data.ydata,'o',data.xdata,yfit)



%% Use the least square curve fit function (lscurvefit)
%lscurvefit computes the sum of square implicitly ....sum {(FUN(THETA,XDATA)-YDATA).^2}
% note from the above that the model function inputs must be given in the
% order (theta,xdata) unlike in fminsearch where you can be flexible with
% the order for the model function.



[thmin_,ssmin_] = lsqcurvefit(fun,theta0,data.xdata,data.ydata);

yfit_=fun(thmin_,data.xdata);

figure;
plot(data.xdata,data.ydata,'o',data.xdata,yfit_)





