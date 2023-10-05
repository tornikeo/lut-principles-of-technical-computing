function ds = decayDAE(t,s,p)

%extract the states
A = s(1); 
B = s(2);

%Extract the parameter values
k=p(1);%
q=p(2);
r=p(3);
c=p(4);

dA = -k*A;  %the ODE equation
B_e=q*A+r*B-c;

ds = [dA;B_e]; %collect the output in vector ds

