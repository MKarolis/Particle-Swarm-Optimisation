function [res] = easomFunction(X1, X2)
res = -cos(X1)*cos(X2) * exp(-(X1 - pi).^2 - (X2 - pi).^2);
end

