function [res] = schwefelFunction(X1, X2)
res = X1*sin((abs(X1))).^(1/2) + X2*sin((abs(X2))).^(1/2);
end

