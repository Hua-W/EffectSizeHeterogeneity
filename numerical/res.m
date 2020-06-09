function val = res(alpha, tau, eps, delta, gamma,  M, sigma)
        %This inner function calculate the residual of the current tau and
        %all other arguments.
        %gamma and M could be vectors. 
        %gamma = [gamma1, gamma2, ...]
        %M = [M1, M2, ...]
        % @author: Hua Wang
        
        val = delta * (1 - sigma^2 / tau^2) - ((1-eps) * funcA(alpha, 0) + eps * gamma * funcA(alpha, M/tau)');
end