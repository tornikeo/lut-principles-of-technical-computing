function ds = ODE1_fun(t,s,theta)
%%% INPUT: 
%%%  t - the time variable (not used in this case)
%%%  s - the state vector
%%% OUTPUT: 
%%%  dX - the derivative dX/dt at time t

X = s(1); %for clarity & readability, write the
          %model using the notation X Y and for the states as in the
          %question
Y = s(2); 
Z = s(3); 

a=theta(1);
b=theta(2);
c=theta(3);

dX = X + a*Y -Z;  % the ODE system equations
dY = X+Z;
dZ= b*X-b*Y+c*Z;


ds = [dX; dY; dZ]; %collect the output in vector ds
end
