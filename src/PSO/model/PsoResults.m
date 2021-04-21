classdef PsoResults
    
    properties
        bestValue;
        bestPosition;
        iterations;
        functionInvocations;
        
        % Array, n-th element holds the best value of n-th iteration
        bestValueHistory;
        
        % Multi-dimensional array pointsHistory(m, n, l), here m is a
        % point, n is a coordinate of a point and l is an iteration. 
        % For instance, you can get the coordinates of a second point in
        % the first iteration with pointsHistory(2, :, 1)
        pointsHistory;
    end
end

