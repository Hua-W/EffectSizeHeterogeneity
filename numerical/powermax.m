%% highest power for delta < 1 and epsilon > epsilon_phase
function power = powermax(delta, epsilon)
if delta >= 1
  power = 1;
  return;
end
epsilon_star = epsilonDT(delta);
if epsilon <= epsilon_star
  power = 1;
  return;
end
power = (epsilon - epsilon_star)*(delta - epsilon_star)/epsilon/(1 - epsilon_star) + epsilon_star/epsilon;
return
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function epsi = epsilonDT(delta)
minus_f = @(x)-(1+2/delta*x*normpdf(x) - 2/delta*(1+x^2)*normcdf(-x))/(1+x^2-2*(1+x^2)*normcdf(-x)+2*x*normpdf(x))*delta;
alpha_phase = fminbnd(minus_f, 0, 8);
epsi = -feval(minus_f, alpha_phase);
return
end