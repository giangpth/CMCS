function [N] = logistic_equa(r, N0, K, Tend)
    N = zeros(1,Tend);
    N(1) = N0;
    for t = 1:Tend-1
        N(t+1) = r*N(t)*(1-N(t)/K);
    end
        