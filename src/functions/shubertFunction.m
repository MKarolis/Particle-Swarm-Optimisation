function [res] = shubertFunction(X1, X2)
    sum1 = 0;
    sum2 = 0;

    for ii = 1:5
        new1 = ii * cos((ii+1).*X1+ii);
        new2 = ii * cos((ii+1).*X2+ii);
        sum1 = sum1 + new1;
        sum2 = sum2 + new2;
    end

    res = sum1 .* sum2;
end

