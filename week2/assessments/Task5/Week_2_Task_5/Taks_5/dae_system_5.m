function dy = dae_system_5(t, Z)

    z = Z(1);
    y = Z(2);
    dzdt = -2 * z + y^2;
    eq2 = 2 * z - 100 * log(y) - 5;
    dy = [dzdt; eq2];
end
