clear all; close all; clc
subplot(131)
x = [0.0 1.0 1.0 2.0 1.8 3.0 4.0 5.2 6.5 8.0 10.0]';
y = [5.00 5.04 5.12 5.28 5.48 5.72 6.00 6.32 6.68 7.08 7.52]';
evaluate(x,y)
title( "Data 1" )
subplot(132)
x = [0.9 1.3 1.3 1.4 1.6 1.8 2.1 2.1 2.5 2.9 3.2 3.3 3.6 4.0 4.2 4.3]';
y = [2.5 4.03 4.1 4.4 5.1 6.05 7.48 7.6 9.8 12.4 14.3 15.2 18.1 19.9 23.0 23.9]';
evaluate(x,y)
title( "Data 2" )
subplot(133)
x = [-3 -2 -1 0 1 2 3]';
y = [7.5 3 0.5 1 3 6 14]';
evaluate(x,y)
title( "Data 3" )
function evaluate(x,y)
    n = length(x);
    preds = zeros(n,1);
    % Linear
    for i = 1:n
        train = setdiff(1:n, i);
        test = i;
        xt = x(train);
        yt = y(train);

        xt_tr = [ones(n-1,1) xt];
        
        theta = xt_tr \ yt;
        
        preds(i) = [1 x(i)] * theta;
    end
    
    plot(x,y, x, preds)
    lin_q2 = 100 * (1 - sum((y - preds) .^2) / sum( (y - mean(y)).^2 ) ) 
    % Poly
    for i = 1:n
        train = setdiff(1:n, i);
        test = i;
        xt = x(train);
        yt = y(train);

        xt_tr = [ones(n-1,1)  xt xt.^2];
        
        theta = xt_tr \ yt;
        
        preds(i) = [1 x(i) x(i).^2] * theta;
    end
    
    plot(x,y, x, preds)
    poly_q2 = 100 * (1 - sum((y - preds) .^2) / sum( (y - mean(y)).^2 ) )
    bar([0,1],[lin_q2, poly_q2]);
    set(gca,'XTickLabel',{'Linear','Poly'});
end