function alpha = findAlphaForTpp(delta, eps, gamma, signals, sigma)
    %The function calculate the value of alpha such that tpp is around 0.0001 via bi-search.
    %
    %The argument given are the values of alpha, delta = n/p, eps = k/p, 
    %gamma, M, and the interval of search: a, b.
    %
    %Sigma is the noise level, tau must be larger than it
    %
    %Ideally, gamma should take a sequence of gammas add to 1, are the prob
    %of each magnitude in sequence M. M is the sequence of magnitudes of
    %non-zero signals. If they are only one number, take gamma = 1, M = 50
    %as default. The upper curve only need this.
    
    
	alpha = 100;
    while true
        tpp = calctpp(alpha, delta, eps, gamma, signals, sigma);
        if tpp < 0.0001
            alpha = alpha / 2;
        else
            break          
        end
    end 
    
    while tpp > 0.0001
        alpha = alpha * 1.2;
        tpp = calctpp(alpha, delta, eps, gamma, signals, sigma);
    end
end