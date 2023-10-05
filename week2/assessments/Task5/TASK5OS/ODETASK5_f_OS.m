function out = ODETASK5_f_OS(t,y)

out = [-2*y(1)+(y(2))^2
        -5+2*y(1)-100*log(y(2))];

end