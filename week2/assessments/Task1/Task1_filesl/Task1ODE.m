function ds = Task1ODE(t,s);
% Input: 't' is the time variable, s is the state vector
% Output: ds is the deravative ds/dt at time 't'
x = s(1);
z = s(2);
% For clarity i have written the model as notations as x and z for the
% components.
% ODE system equations are mentioned below
dx = z + 4; 
dz = -3*x;
ds = [dx;dz]; % Collecting the output in vector ds
end