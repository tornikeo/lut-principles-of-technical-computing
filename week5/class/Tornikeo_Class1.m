clear all; close all; clc;
load('Data_class.mat')
main(x1,x2,y)
function main(x1,x2,y)
    N = length(y);
    R2 = zeros(N);
    y_val_preds = zeros(N,1);
    for i = 1:N
        x1_train = setdiff(x1, x1(i));
        x2_train = setdiff(x2, x2(i));
        y_train = setdiff(y, y(i));
        [y_fit, theta_opt] = predict(x1_train, x2_train, y_train);
        y_val_preds(i) = [x1(i), x2(i), x1(i) * x2(i)] * theta_opt';
    end
    R2 = 1-sum( (y_val_preds-y).^2 ) ./ sum( (y-mean(y)).^2 );
    R2
    function [y_fit, theta_opt] = predict(x1, x2, y)
        % x_tr = [x1, x2, x1 .* x2];
        x_tr = [x1, x2, x2 .^ 2];
        theta_opt = y \ x_tr;
        y_fit = x_tr * theta_opt';
    end
end