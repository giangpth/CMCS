function [S,I,R] = sir_model(beta,gamma,mu,vp,S0,I0,T,dt)
    % if delta = 0 we assume a model without immunity loss
    S = zeros(1,T/dt);
    S(1) = S0;
    I = zeros(1,T/dt);
    I(1) = I0;
    R = zeros(1,T/dt);
    for tt = 1:(T/dt)-1
        % Equations of the model
        dS = (-beta*I(tt)*S(tt) -mu*S(tt) + (1-vp)*mu) * dt;
        dI = (beta*I(tt)*S(tt) - gamma*I(tt) - mu*I(tt)) * dt;
        dR = (gamma*I(tt) - mu*R(tt) + vp*mu) * dt;
        S(tt+1) = S(tt) + dS;
        I(tt+1) = I(tt) + dI;
        R(tt+1) = R(tt) + dR;
    end
end


