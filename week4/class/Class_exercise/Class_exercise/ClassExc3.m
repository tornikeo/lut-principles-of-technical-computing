clear all; close all; clc;

data.x =  [5 7 11 12 15 17 19]';
data.y =  [0.93 0.91 0.84 0.82 0.76 0.71 0.66]';

theta_init = [.1, .4];

args.x = data.x;
args.y = data.y;
% args.theta = theta_init;

theta = fminsearch(@(theta) loss(theta, args), theta_init);

preds.y = model(data.x, theta);
plot(data.x, data.y, '-', data.x, preds.y, 'x')

function y = model(x, theta)
    y = 1./(exp(theta(1) + theta(2) .* x .^ 2));
end

function l = loss(theta, args)
    x = args.x;
    y = args.y;
    y_preds = model(x, theta);
    l = sum((y_preds - y) .^ 2);
end