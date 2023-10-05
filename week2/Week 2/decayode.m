function ds = decayode(t,s,k)

A = s(1);%extract the state 
dA = -k*A;  %the ODE equation

ds = dA; %collect the output in vector ds

