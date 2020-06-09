function okay = validAlpha(alpha, eps, delta)
% To see whether a alpha has a solution given the eps and delt
if eps * funcA(alpha,0) + (1-eps) * (1+alpha^2) > delta
    okay = true;
else
    okay = false;
end
end