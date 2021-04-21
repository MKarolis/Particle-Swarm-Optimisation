% Vectorised for plotting performance
function [res] = rastriginFunction(X1, X2)
    res = 10*2 + X1.^2 - 10*cos(2*pi*X1) ...
        + X2.^2 - 10*cos(2*pi*X2);
end
