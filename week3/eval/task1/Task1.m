% Fitting a linear model to data

x1 = [2.1 4.3 7.0 9.1 10.5 12.7 15.2]';
x2 = [10.4 15.5 21.0 24.9 30.3 33.8 41.4]';
y = [26.5 57.9 108.4 155.9 209.3 272.4 384.3]';

n = length(y); 

X = [x1 x2];
X2 = [ones(n,1), X, X(:,1).*X(:,2)];

b = X2 \ y;

yfit = X2 * b;

plot(1:n, y, 'o', 1:n, yfit, '-');
title('model fit');
legend('data', 'fit');
xlabel('x');
ylabel('y');

