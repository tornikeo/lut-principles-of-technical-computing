function ss=beerss(theta,data,T0,Ta,Tw)

t=data(:,1);%extract the time data
Tobs=data(:,2);%extract the temperature data

[t,Tmod]=ode45(@beerode,t,T0,[],theta,Ta,Tw);%call the ODE solver

ss=sum((Tobs-Tmod).^2);%calculate the residual sum of squared

% do some plotting 'on the go'
plot(t,Tmod,t,Tobs,'o');
xlabel('time')
ylabel('temp')
drawnow;
pause(0.2);