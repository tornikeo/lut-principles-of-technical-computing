clear all; close all; clc;
x = randn([5,4])
mean = MEAN(x)
var = VAR(x)
cov = COV(x)
corr = CORR(x)
function mean = MEAN(x)
    n = length(x);
    mean = sum(x,1) / n;
end

function var = VAR(x)
    n = length(x);
    var = sum((x - MEAN(x)).^2) / (n-1);
end
function cov = COV(x,y)
    if ~exist('y','var')
        y = x;
    end
    n = length(x);
    cov = 1/(n-1) .* ( (x - MEAN(x))' * (y - MEAN(y)) ); 
end
function corr = CORR(x,y)
    if ~exist('y','var')
        y = x;
    end
    n = length(x);
    corr = COV(x,y) ./ (sqrt(VAR(x)) .* sqrt(VAR(y)));
end