function epsi = epsilonDT(delta)
% Function to find the critical DT phase transition eps^*
minus_f = @(x)-(1+2/delta*x*normpdf(x) - 2/delta*(1+x^2)*normcdf(-x))/(1+x^2-2*(1+x^2)*normcdf(-x)+2*x*normpdf(x))*delta;
alpha_phase = fminbnd(minus_f, 0, 8);
epsi = -feval(minus_f, alpha_phase);
return
end