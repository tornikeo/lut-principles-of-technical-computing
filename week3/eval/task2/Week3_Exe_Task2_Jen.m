clear all; close all; clc
load("data_1.mat") % Load the xy data
% Make the model linear by using a log transformation
% y = 1/(1+exp(-(theta0 + theta1*x)
% 1/y= 1+ exp(-(theta0 + theta1*x)
% 1/y - 1= exp(-(theta0 + theta1*x)
% log(1/y -1)= -(theta0 + theta1*x)
% log(1/y -1)= - theta0 - theta1*x

% Fitting a linear model to data
X=xy(:,1);
Y=xy(:,2);
n=length(X); % number of data points
XX=[ones(n,1) X]; % Define the coefficient matrix
YY=log(1./Y-1); % log transformation
theta=XX\YY; % estimate the parameters
theta0=-theta(1); 
theta1=-theta(2);
Yfit=1./(1+exp(-(theta0+theta1.*X)));

figure;
plot(X,Y,'o',X,Yfit); title('model fit'); grid on





