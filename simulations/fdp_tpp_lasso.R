## This file serves to provide auxilary functions that will be used in our simulations.
## Copyright: Hua Wang, Yachong Yang and Weijie Su 2020.

library(MASS)
library(glmnet)
## Essential func that used in the simulation.
fdp_tpp_lasso <- function(X, beta, eps, lambda){
  ##X is matrix, beta, eps, lambda are vectors
  Y=X%*%beta + eps
  fit<-glmnet(X,Y,intercept=T, lambda = lambda, thresh = 1e-12)
  betahat <- coef(fit)[-1, ]
  discov <- apply(betahat!=0, 2, sum)
  falsediscov <- apply(betahat[-(1:s), ]!=0, 2, sum)
  fdp_vec=falsediscov/discov
  tpp_vec=(discov-falsediscov)/s
  return(list(fdp_vec, tpp_vec))
}

## Find a log_spaced sequence.
lseq = function(from, to, length.out) {
  exp(seq(log(from), log(to), length.out = length.out))
}

## Helper function to draw the histogram of signals
helper <- function(y, C){
  ret = c()
  for(i in 1:length(y)){
    ret = c(ret, rep(i,C*y[i]))
  }
  return(ret)
}