## This is an example of how to use our fdp_tpp_lasso function, and how to do simulations.
## This is the simulation for Figure 1 in the paper

source("fdp_tpp_lasso.R")

#####################################################
n=1000
p=1000
s=200
total = 100
sim_name = "3Simulation_with_noise=0.01_exp"

##Set X's baselines
X_raw = 0

##Set signals
beta1=rep(0,p) # Weakest
beta1[1:s]=exp(c(4, 4, 4, 3, 3, 3, 2,2,2, 1))

beta2=rep(0,p) # Strongest
beta2[1:s]=exp(rep(6,s))

beta3=rep(0,p) #Moderate
beta3[1:s]=exp(c(5, 4))

##Set lambdas (if exp)
lambda1 <- c(lseq(0.02, 2, length.out = 170), seq(2, 3.5, length.out = 30))
lambda2 <- c(lseq(2.8, 25, length.out = 170), seq(25, 32, length.out = 30))
lambda3 <- c(lseq(0.45, 6, length.out = 160), seq(6, 10, length.out = 40))

########################################################################################
##Uniteresting details keep track of fdp and tpp
fdp1=matrix(0, total,length(lambda1))
tpp1=matrix(0, total,length(lambda1))
fdp2=matrix(0, total,length(lambda2))
tpp2=matrix(0, total,length(lambda2))
fdp3=matrix(0, total,length(lambda3))
tpp3=matrix(0, total,length(lambda3))

##Simulation
for (k in 1:total){
  print(k)
  X=mvrnorm(n,rep(0,p),diag(1/n,p))
  X <- scale(X_raw + X)/sqrt(n-1)
  eps = rnorm(n, 0, 0.01)  ##w/ small noise = 0.1

  ft1 = fdp_tpp_lasso(X, beta1, eps, lambda1)
  
  ft2 = fdp_tpp_lasso(X, beta2, eps, lambda2)
  
  ft3 = fdp_tpp_lasso(X, beta3, eps, lambda3)
  
  fdp1[k,]=ft1[[1]]
  tpp1[k,]=ft1[[2]]
  
  fdp2[k,]=ft2[[1]]
  tpp2[k,]=ft2[[2]]
  
  fdp3[k,]=ft3[[1]]
  tpp3[k,]=ft3[[2]]
}

##Get fdp and tpp
fdp11=apply(fdp1,2,mean)
fdp22=apply(fdp2,2,mean)
fdp33=apply(fdp3,2,mean)

tpp11=apply(tpp1,2,mean)
tpp22=apply(tpp2,2,mean)
tpp33=apply(tpp3,2,mean)

simulation <- data.frame(tpp22,fdp22,tpp33,fdp33,tpp11,fdp11)

write.table(simulation, paste0(sim_name,".txt"), sep="\t", row.names = F, col.names = F)