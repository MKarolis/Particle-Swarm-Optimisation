%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Performs Particle Swarm Optimisation for a given function.
% INPUT:
% config - PsoConfig class instance
% fun - fitness function handle. Must accept a vector as a sole argument.
%   Example: fun = @(X) (sphereFunction(X(1), X(2)))
%
% OUTPUT:
% results - PsoResults class instance
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function results = PSO(config, fun)
    arguments
        config PsoConfig
        fun function_handle
    end
    
    invoker = FunctionInvoker(fun);
    
    %% Configuration extraction from input
    particleCount = config.particleCount;
    bounds = config.bounds;
    maxIterations = config.maxIterations;
    inertiaCoef = config.inertiaCoefficient;
    dampingCoef = config.dampingCoefficient;
    cognitiveCoef = config.cognitiveCoefficient;
    socialCoef = config.socialCoefficient;
    dimensions = config.dimensions;
    
    %% Data initialisation
    particles(particleCount, 1) = Particle();
    globalBestPosition = [];
    globalBestValue = inf;
    bestValuesHistory = zeros([maxIterations 1]);
    pointsHistory(particleCount, dimensions, maxIterations) = 0;
    % Initialisation is treated as the first iteration
    iterations = 1;
    
    % Initialise particles
    for it=1:particleCount
        % Uniform distribution of initial positions
        particles(it).position = unifrnd(bounds(1), bounds(2), [1 dimensions]);
        particles(it).value = invoker.get(particles(it).position);
        particles(it).velocity = zeros([1 dimensions]);

        particles(it).bestPosition = particles(it).position;
        particles(it).bestValue = particles(it).value;

        if particles(it).value < globalBestValue
            globalBestPosition = particles(it).position;
            globalBestValue = particles(it).value;
        end
        
        pointsHistory(it, :, iterations) = particles(it).position;
    end
    bestValuesHistory(iterations) = globalBestValue;    
    
    %% Main PSO loop
    while(iterations < maxIterations)
        iterations = iterations + 1;
        for i=1:particleCount
            particles(i).velocity = inertiaCoef * particles(i).velocity ...
                + cognitiveCoef*rand([1 dimensions]).*(particles(i).bestPosition - particles(i).position) ...
                + socialCoef*rand([1 dimensions]).*(globalBestPosition - particles(i).position);

            particles(i).position = particles(i).position + particles(i).velocity;
            particles(i).value = invoker.get(particles(i).position);

            if particles(i).value < particles(i).bestValue
                particles(i).bestPosition = particles(i).position;
                particles(i).bestValue = particles(i).value;

                if particles(i).value < globalBestValue
                    globalBestValue = particles(i).value;
                    globalBestPosition = particles(i).position;
                end
            end
            pointsHistory(i, :, iterations) = particles(i).position;
        end
        inertiaCoef = inertiaCoef*dampingCoef;
        bestValuesHistory(iterations) = globalBestValue;
        
        if (iterations > 10 && ...
                bestValuesHistory(iterations - 10) - globalBestValue < config.targetAccuracy)
            break;
        end
    end
    
    %% Populate ouput object
    results = PsoResults();
    results.bestValue = globalBestValue;
    results.bestPosition = globalBestPosition;
    results.bestValueHistory = bestValuesHistory;
    results.functionInvocations = invoker.count;
    results.iterations = iterations;
    results.pointsHistory = pointsHistory;
end

