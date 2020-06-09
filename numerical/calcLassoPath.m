function [tpp, fdp] = calcLassoPath(delta, eps, gamma, signals, sigma, N)
%--------------------------------------------------------------------------
% This function serves the purpose of output tpp and fdp along the
% Lasso path, for any finite-point prior.
% @params: 
%  DELTA = n / p
%  EPS = k / p
%  GAMMA is a vector of probs of the finite priors 
%  SIGNALS is the vector of values of the finite priors (respectively).
%  SIGMA is the noise level, i.e. noise ~ N(0, sigma^2).
%  N is the maximum number of tpp-fdp vector going to output
% @output:
%  TPP/FDP: vector of same length correspondingly.
%--------------------------------------------------------------------------
% Copyright @ Hua Wang, Yachong Yang, and Weijie Su, 2020
%--------------------------------------------------------------------------

    tpp = zeros(1, N);
    fdp = zeros(1, N);
    alpha_incr = findAlphaForTpp(delta, eps, gamma, signals, sigma) / N;
    for i = 1:N
        alpha = (N-i)*alpha_incr;%+1.99;
        tpp(i) = calctpp(alpha, delta, eps, gamma, signals, sigma);
        fdp(i) = calcfdp(alpha, delta, eps, tpp(i));
        if tpp(i) < 0 || fdp(i) < 0
            tpp(i:N) = []; % No need to search further
            fdp(i:N) = [];
            break
        end
    end
end



