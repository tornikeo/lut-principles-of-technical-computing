function ds = ODE2_fun(t,s)
%%% INPUT: 
%%%  t - the time variable (not used in this case)
%%%  s - the state vector
%%% OUTPUT: 
%%%  dNp - the derivative dNp/dt at time t

Np = s(1); %extract the state Np
Nh=s(2);

dNp=0.1*Np-0.005*Np*Nh;% prey population
dNh=-0.02*Nh+0.001*Np*Nh;% predator population


ds=[dNp dNh]'; %collect the output in vector ds
end
