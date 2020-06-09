The readme is as follows:

The functions:


-- calctpp(alpha, delta, eps, gamma, M):
    #The function that computes tpp, using the equation: P(|Pi^* + tau Z| > alpha tau)
    ## Dependent on function calctau

--- calctau(alpha, delta, eps, gamma, M):
    #The function calculates tau via bi-search (for reasonable input of alpha)
    #The equation is AMP I.
    ## Dependent on function res, funcA

---- res(alpha, tau, eps, delta, gamma,  M):
    #The function that rearranges AMP I, and it should = 0. This solves tau using bi-search.

---- funcA(alpha, x):
    #The expansion of E[eta_alpha(x+z)-x]^2, where z ~ N(0, 1) and `eta_alpha` is the soft-threshold function at alpha.

-- calcalpha0(delta):
    #The function calculate alpha0: the solution of (1 + t^2) Phi(-t) - t phi(t) = delta/2



