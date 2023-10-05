function ds = myfirstode(t,s,k)
%input t the time variable (not used in this case)
% s the state vector
% k1,k2 model parameters
%output ds the derivative ds/dt at time t
A = s(1); %for clarity & readability, write the
B = s(2); %model using the notation A,B,C for the
C = s(3); %components

%extract the model parameters
k1=k(1);
k2=k(2);
dA = -k1*A; %the ODE system equations
dB = k1*A - k2*B;
dC = k2*B;
ds = [dA;dB;dC]; %collect the output in vector ds