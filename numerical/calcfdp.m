function fdp = calcfdp(alpha, delta, eps, tpp)
    % The function finds fdp given eps, alpha and tpp. It's also a wrapper
    % concerning the invalid inputs of tpp < 0; or above the eps/delta*tpp + fdp<= 1 line
    % @author: Hua Wang
    % It returns fdp = -1 if no valid solution.
    if tpp < 0 
        fdp = -1;
    else    
        fdp = 2 * (1 - eps) * normcdf(-alpha)/(2 * (1 - eps) * normcdf(-alpha)+ eps * tpp);
    end
    if tpp * eps / delta + fdp > 1
        fdp = -1; % This is an invalid point since Lasso never above that line
    end
end
