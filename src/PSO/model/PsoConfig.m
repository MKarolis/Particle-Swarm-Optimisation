classdef PsoConfig
  
    properties
        % bounds = [lowerBound upperBound]
        bounds;       
        particleCount;
        maxIterations;
        % If the difference between ten consecutive best values is less
        % than targetAccuracy, algorithm is stopped. 
        % Set to 0 in order to disable the criteria.
        % the criteria
        targetAccuracy;
        % Number of dimensions for the function being optimised
        dimensions;
        % PSO parameters
        inertiaCoefficient;
        cognitiveCoefficient;
        socialCoefficient;
        dampingCoefficient;
    end
end
