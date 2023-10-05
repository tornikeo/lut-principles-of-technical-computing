clear all; close all; clc;

main()
function main()
    raw_data1 = [
    0 1.000 0.000
    1 0.504 0.416
    2 0.186 0.489
    3 0.218 0.595
    4 0.022 0.506
    5 0.102 0.493
    6 0.058 0.458
    7 0.064 0.394
    8 0.000 0.335
    9 0.082 0.309
    ];
    
    data1.temperature = 282; 
    data1.time = raw_data1(:,1);
    data1.y_true = raw_data1(:,2:end);
    
    raw_data2 = [
    0 1.000 0.000
    1 0.415 0.518
    2 0.156 0.613
    3 0.196 0.644
    4 0.055 0.444
    5 0.011 0.435
    6 0.000 0.323
    7 0.032 0.390
    8 0.000 0.149
    9 0.079 0.222
    ];
    
    data2.temperature = 313; 
    data2.time = raw_data2(:,1);
    data2.y_true = raw_data2(:,2:end);
    
    R = 8.314;
    Tref = 300; % Kelvin
    k1ref = 1;
    k2ref = 1;
    E1 = 1e4;
    E2 = 1e4;
    tspan = 0:1:9;
    initial_conds = [1,0]; % A and B, at t=0

    subplot(121)
    solve(data1)
    subplot(122)
    solve(data2)

    % main
    % main calls solve(data1)
    % solve calls fminsearch on loss
    % loss itself calls predict_y, with theta
    % predict_y calls two things, calls k
    % k gives k1, and k2 values
    % predict_y then calls ode23 on model_ode


    function k = k(T, kref, E)
        k = kref * exp(E ./ R .* (1./T - 1./Tref) );
    end

    function solve(data)
        % loss = @(theta) sum(sum((predict_y(theta, data) - data.y_true) .^ 2));

        theta = [k1ref, E1, k2ref, E2];
        theta_optim = fminsearch(@loss, theta, []);
    
        plot(data.time, data.y_true(:,1), 'bo'); hold on;
        plot(data.time, data.y_true(:,2), 'ro'); hold on;
        sol = predict_y(theta_optim, data);
        plot(data.time, sol(:,1), 'b-'); hold on;
        plot(data.time, sol(:,2), 'r-')
        title(sprintf("T = %.2f K",data.temperature))
        legend({"Substance A", "Substance B"})

        function loss = loss(theta)
            loss = sum(sum((predict_y(theta, data) - data.y_true) .^ 2));
        end
    end
    
    function y_pred = predict_y(theta, data)
        % Theta - stuff we want to optimize/find, initial estimate of these
        % solver - Function that returns actual ODE solutions (i.e. y_preds)
        k1ref = theta(1);
        E1 = theta(2);
        k2ref = theta(3);
        E2 = theta(4);
        [t,y_pred] = ode23(@model_ode, tspan, initial_conds, [], ...
            k(data.temperature, k1ref, E1), k(data.temperature, k2ref, E2));
    end
    
    function ds = model_ode(t, s, k1, k2)
        A = s(1);
        B = s(2);
        dA = -k1 .* A;
        dB = k1 .* A - k2 .* B;
        ds = [dA; dB];
    end
end
