function [res] = bokachevskyFunction(X1, X2)
res = X1.^2 + 2*X2.^2 - 0.3 * cos(3*pi*X1) - 0.4*cos(4*pi*X2) + 0.7;
end

