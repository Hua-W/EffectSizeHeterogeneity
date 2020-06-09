# EffectSizeHeterogeneity
This is the code reference for the paper Effect Size Heterogeneity Matters

In the folder **numerical**, are the codes for solving and plotting the Lasso Crescent numerically. 
- The main function here is the *calcLassoPath.m*. It automatically calculates (tpp, fdp) pairs along the Lasso path.

I also provide two files that illustrate how to use it to draw Lasso paths: 
- The file *LassoCrescent.m* shows how to draw a Lasso Crescent for a given set of parameters.
- The file *multipleTouchs.m* shows how to numerically solve Lasso Paths that intersects the lower boundary multiple times.

In the folder **simulations**, are the codes for simulations. 
- The core function is in the source file *fdp_tpp_lasso.R*. 
- The file *3Settings.R* provides a good illustration of how to use our function to do simulations, and is the simulation for
Figure 1 in the paper.
