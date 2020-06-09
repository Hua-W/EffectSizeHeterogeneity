function tpp = calctpp(alpha, delta, eps, gamma, M, sigma)
    % The function finds tpp given alpha, delta, eps, gamma, M, and sigma.
    % @author: Hua Wang
    
   
    tau = calctau(alpha, delta, eps, gamma, M, sigma);
    if tau < 0
        tpp = -1; %return this to show it's invalid
    else
        tpp = gamma * (1 - normcdf(alpha - M/tau) + normcdf(- alpha - M/tau))';
    end
end
