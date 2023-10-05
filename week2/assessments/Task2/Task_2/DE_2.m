function ds = DE_2(t, s, k)
    x1 = s(1); x2 = s(2);

    k1 = k(1); k2 = k(2); a = k(3);
    
    dx1 = -k1*x1 + a; 
    dx2 = -k1*x1 - k2*x2 + a;

    ds = [dx1; dx2];
end