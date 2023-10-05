function ds = ABCDE_ODE(t,s,params)
%input t the time variable (not used in this case)
% s the state vector
% model parameters, k1, k2,k3
%output ds the derivative ds/dt at time t
A = s(1); %for clarity & readability, write the
B = s(2); %model using the notation A,B,C,D,E,F for the
C = s(3); %components
D = s(4); 
%E = s(5); %last two are the end products of the chemical reaction, not
%used in any of the ODE equations beacause they are not reactants...but we need to simulate them
%F = s(6); 


k1=params(1); %extracting the parameters
k2=params(2);
k3=params(3);

dA = -k1*A*B-k2*A*C-k3*A*D; %the ODE system equations
dB = -k1*A*B;
dC = k1*A*B-k2*A*C;
dD = k2*A*C-k3*A*D;
dE = k3*A*D;
dF =  k1*A*B + k2*A*C + k3*A*D;
ds = [dA;dB;dC;dD;dE;dF]; %collect the output in vector ds



