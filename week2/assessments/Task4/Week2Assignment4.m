clear all
s0 = [1,2,3];
tspan = [0,360];
[t,s] = ode45(@variable,tspan,s0,[]);

figure; hold on;
plot(t,s);
legend('sa','sb','sc');
grid on;
hold off;

clear all; clc;

function sd = variable(t,s)

A = s(1);
B = s(2);
C = s(3);
sa = 100*(B-A*B+A-(1/10^5)*A^2);
sb = (-B-A*B+1.1*C)/100;
sc = 3.835*(A-C);
sd = [sa;sb;sc];

end