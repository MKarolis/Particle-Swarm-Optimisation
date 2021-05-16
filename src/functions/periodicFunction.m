function [res] = periodicFunction(X1, X2)
res = -(1 + (sin(X1)).^2 + (sin(X2)).^2 - 0.1*exp(-X1.^2 -X2.^2));
end

