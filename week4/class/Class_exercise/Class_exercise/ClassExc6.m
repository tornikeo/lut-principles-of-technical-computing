clear all; close all; clc;
load ODE2_data.mat
plot(t, y, '-'); hold on;
legend( "Np actual" )


N_prey_init = 40;
N_h_init = 9;
param_init = [0.2 0.025 0.02 0.01];

% plot(t, y)
% function ds = ode_model(t, s, )
tspan = t;
ode_init_conds = [N_prey_init, N_h_init];

r = param_init(1);
a = param_init(2);
s = param_init(3);
b = param_init(4);

[t,s] = ode23(@ode_model, tspan, ode_init_conds, [], r, a, s, b);

Np_predicted = s(:,1);
plot(t,s(:,1),'x')

theta = fminsearch(@(theta) loss(theta, args), theta_init);


% Once we have correct theta, plot once more



function ds = ode_model(t, N, r, a, s, b)
    % t - Time
    % N - contains both Np and Nh
    % Rest are constants
    N_p = N(1);
    N_h = N(2);
    dNp = r .* N_p - a .* N_p .* N_h;
    dNh = - s .* N_h + b .* N_p .* N_h;
    ds = [dNp; dNh];
end

function s = ode_solution(t, N, r, a s, b)
    
end

function l = loss(theta, args)
    x = args.x;
    y = args.y;
    y_preds = model(x, theta);
    l = sum((y_preds - y) .^ 2);
end