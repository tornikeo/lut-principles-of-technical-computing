function ds = ODE2_fun(t,s,params)
%%% INPUT: 
%%%  t - the time variable (not used in this case)
%%%  s - the state vector
%%% OUTPUT: 
%%%  dNp - the derivative dNp/dt at time t

Np = s(1); %extract the state Np
Nh=s(2);

r=params(1);
a=params(2);
s=params(3);
b=params(4);

dNp=r*Np-a*Np*Nh;% prey population
dNh=-s*Nh+b*Np*Nh;% predator population


ds=[dNp dNh]'; %collect the output in vector ds
end
