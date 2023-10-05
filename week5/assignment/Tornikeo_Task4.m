clear all; close all; clc
% load xy.mat
xy = [
    1	3
    2	7.30000000000000
    3	11.9000000000000
    4	23.6000000000000
    5	47.5000000000000
    6	100.400000000000
    7	220.800000000000
];

x = xy(:,1);
y = xy(:,2);
n = length(xy);
func = @(x, t) t(1) .* x .* exp(1 + t(2) * x.^2);
loss = @(t) sum( (y - func(x,t)).^2 );
[theta, ssmin] = fminsearch(loss, [1, 0.1]);
J = [ x .* exp( 1 + theta(2) .* x .^ 2 ), ...
    theta(1) .* x.^3 .* exp(1 + theta(2) .* x .^ 2)];
sigma2 = ssmin / (n-2);
C = sigma2 * inv(J'*J);
disp('(theta, std, t-values):');
[theta(:) sqrt(diag(C)) theta(:)./sqrt(diag(C))]

plot(x,y, 'ro', x, func(x, theta), 'b-')