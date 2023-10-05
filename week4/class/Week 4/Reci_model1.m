clear all; close all; clc
% Script file for fitting the nonlinear model in ClassExerscise task 5
data.xdata = [1:3:9, 11 14 19 21 23]'; % X(input) data
data.ydata = [0.13    0.24   0.27    0.29    0.30    0.31    0.31    0.31]'; % Y(response) data

% Generally, we write the codes for modelling and statistics
% in separate m-files. For simple cases, both are easy
% to write as one line anonymous functions using the @ construct:
 
fun = @(theta,x) x./(theta(1)+theta(2)*x); 

ssfun    = @(theta,data) sum((data.ydata-fun(theta,data.xdata)).^2); % ss function

% Then minimize ssfun using 'fminsearch'.

th_init = [100 50]; % ... after some trial & error, by plotting various options
[thmin, ssmin] = fminsearch(ssfun,th_init,[],data);

yfit=fun(thmin,data.xdata);

figure;
plot(data.xdata,data.ydata,'o',data.xdata,yfit)




%% Solve without using a data structure

x = [1:3:9, 11 14 19 21 23]'; % X(input) data
y = [0.13    0.24   0.27    0.29    0.30    0.31    0.31    0.31]'; % Y(response) data

% Generally, we write the codes for modelling and statistics
% in separate m-files. For simple cases, both are easy
% to write as one line anonymous functions using the @ construct:
 
fun = @(theta,X) X./(theta(1)+theta(2)*X); 

%ssfun    = @(theta,data) sum((data.ydata-fun(theta,data.xdata)).^2); % ss function
ssfun    = @(theta,X,Y) sum((Y-fun(theta,X)).^2); % ss function

% Then minimize ssfun using 'fminsearch'.

th_init = [1 0.15]; % ... after some trial & error, by plotting various options
[thmin,ssmin] = fminsearch(ssfun,th_init,[],x,y);

yfit=fun(thmin,x);

figure;
plot(x,y,'o',x,yfit)



%% Use the least square curve fit function (lscurvefit)
%lscurvefit computes the sum of square implicitly ....sum {(FUN(THETA,XDATA)-YDATA).^2}
% note from the above that the model function inputs must be given in the
% order (theta,xdata) unlike in fminsearch where you can be flexible with
% the order for the model function.

[thmin_,ssmin_] = lsqcurvefit(fun,th_init,data.xdata,data.ydata);

yfit_=fun(thmin_,data.xdata);

figure;
plot(data.xdata,data.ydata,'o',data.xdata,yfit_)








