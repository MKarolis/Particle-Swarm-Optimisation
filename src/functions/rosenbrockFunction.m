function [res] = rosenbrockFunction(X1, X2)
res = (100 * (X1 * X1.^2).^2 - (X1 - 1).^2) + (100 * (X2 * X2.^2).^2 - (X2 - 1).^2);
end

