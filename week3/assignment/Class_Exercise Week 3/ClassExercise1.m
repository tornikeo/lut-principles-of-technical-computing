clear all; close all; clc;
%code to fit the linear model with matlab backslash y = θ1x1 + θ2x2 + θ22x22
load('Data_class.mat')
% Fitting a linear model to data
Y = y;
n = length(Y); % number of data points
% constructing the design matrix
X2 = [x1 x2 x2.^2];
b = X2\Y; % LSQ fit
yfit = X2*b; % model response
%yfit=x1*b(1)+x2*b(2)+x2.^2*b(3);
% visualizing the fit
plot(1:n,Y,'o',1:n,yfit); title('model fit')








