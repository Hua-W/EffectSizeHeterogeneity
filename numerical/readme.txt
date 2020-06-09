The functions we provided here jointly solve a Lasso path numerically.

- calcLassoPath(delta, eps, gamma, signals, sigma, N):
    The @main function that calculates (tpp, fdp) pairs along a Lasso path.
    - Dependent on findAlphaForTpp, calctpp, calcfdp.

- findAlphaForTpp(delta, eps, gamma, signals, sigma):
    The function to find fine-tuned alpha via bi-search.
    - Dependent on calctpp.

- calctpp(alpha, delta, eps, gamma, M):
    The function that calculates tpp, using the equation: P(|Pi^* + tau Z| > alpha tau)
    - Dependent on calctau

- calcfdp(alpha, delta, eps, tpp):
    The function that calculates fdp, given tpp.

- calctau(alpha, delta, eps, gamma, M):
    The function calculates tau via bi-search (for reasonable input of alpha) from AMP equation.
    - Dependent on res, funcA

- res(alpha, tau, eps, delta, gamma,  M):
    The function that solves tau in AMP equation by bi-search.

- funcA(alpha, x):
    The expansion of E[eta_alpha(x+z)-x]^2, where z ~ N(0, 1) and `eta_alpha` is the soft-threshold function at alpha.

- calcalpha0(delta):
    The function calculate alpha0: the solution of (1 + t^2) Phi(-t) - t phi(t) = delta/2



