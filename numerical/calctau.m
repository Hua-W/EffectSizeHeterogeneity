function tau = calctau(alpha, delta, eps, gamma, M, sigma)
    % The function calculate the value of tau via bi-search.
    % @author:Hua Wang
    %
    % The argument given are the values of alpha, delta = n/p, eps = k/p, 
    % gamma, M, and the interval of search: a, b.
    %
    % Sigma is the noise level, tau must be larger than it
    %
    % Ideally, gamma should take a sequence of gammas add to 1, are the prob
    % of each magnitude in sequence M. M is the sequence of magnitudes of
    % non-zero signals. If they are only one number, take gamma = 1, M = 50
    % as default. The upper curve only need this.
    
    
    %a0 = max(calcalpha0(delta), 0);
    %a = a0 + 1e-2;
    a = 1;
    b = 100;
        
   while res(alpha, a + sigma, eps, delta, gamma, M, sigma) * res(alpha, b + sigma, eps, delta, gamma, M, sigma) > 0
        %a = a0 + (a - a0) * 0.1;
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