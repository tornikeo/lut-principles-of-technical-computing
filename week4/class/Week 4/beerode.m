function dT=beerode(t,T,k,Ta,Tw)

dT=-k(1)*(T-Tw)-k(2)*(T-Ta);%ODE equation and output