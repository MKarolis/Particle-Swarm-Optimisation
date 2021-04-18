classdef PsoConfig
  
    properties
        % bounds = [lowerBound upperBound]
        bounds;       
        particleCount;
        maxIterations;
        % Number of dimensions for the function being optimised
        dimensions;
        % PSO parameters
        inertiaCoefficient;
        cognitiveCoefficient;
        socialCoefficient;
        dampingCoefficient;
    end
end
