function tau = calctau(alpha, delta, eps, gamma, M, sigma)
    % The function calculate the value of tau via bi-search.
    % @author:Hua Wang
    %
    % @params: 
    % ALPHA, DELTA = n/p, EPS = k/p, 
    % GAMMA and M jointly represents a finite-point prior.
    % SIGMA is the noise level. tau must be larger than it
    % 
    % If there's no valid solution, return tau = -1.
       
    a = 1;
    b = 100;
        
   while res(alpha, a + sigma, eps, delta, gamma, M, sigma) * res(alpha, b + sigma, eps, delta, gamma, M, sigma) > 0
        a = a * 0.1;
        b = b * 10;
        if a < 1.0e-14
            tau = -1; % return a invalid value, for that the tau is too small and can be skipped.
            return
        end
    end
    e = 1.0e-6;
    a = a + sigma; % To make tau always larger than sigma.
    b = b + sigma;
    tau = (a + b)/2;
    n = 0; %the time of search.
    
    while (b - a) >= e
        if n > 100 % take too long!!
            tau;
            return
        end
        % If the res is already small
        if abs(res(alpha, tau, eps, delta, gamma, M, sigma)) < e
            tau;
            return
        % If the zero is on the right
        elseif res(alpha, a, eps, delta, gamma, M, sigma) * res(alpha, tau, eps, delta, gamma, M, sigma) > 0 
            a = tau;
            tau = (a + b) / 2;
            n = n + 1;
        % If the zero is on the left
        elseif res(alpha, b, eps, delta, gamma, M, sigma) * res(alpha, tau, eps, delta, gamma, M, sigma) > 0 
            b = tau;
            tau =(a + b) / 2;
            n = n + 1;
        end
    end
end