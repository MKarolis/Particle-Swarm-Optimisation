functionWrapper = @(X) (shubertFunction(X(1), X(2))); 
% Populate configuration
config = PsoConfig();
config.bounds = [-10 10];
config.dimensions = 2;
config.particleCount = 50;
config.maxIterations = 100;
config.targetAccuracy = 10^-15;
config.inertiaCoefficient = 0.5;
config.cognitiveCoefficient = 1.7;
config.socialCoefficient = 1.7;
config.dampingCoefficient = .99;

%result saving variables
totalIterations = 0;
totalInvocations = 0;
totalresults = 0;
minResult = realmax;
maxResult = -realmax;
minIterations = intmax;
maxIterations = -intmax;
minInvocations = intmax;
maxInvocations = -intmax;

results = PSO(config, functionWrapper); %a 
disp(results);
% Plot results
graphWrapper = @(X1, X2) (shubertFunction(X1, X2));
plotService = PlotService();
plotService.createGif(results, graphWrapper, config.bounds, config.bounds, 'X1', 'X2', 10, 50, 'figure.gif', 0.2, 'gif');
%plotService.figure3D(graphWrapper, config.bounds, config.bounds, [-190 190], 'X1', 'X2', 'f(X)', "Shubert's function", 1000)

% Execute PSO  
iterationsArray = [];
invocationsArray = [];
bestresultArray = [];

for it=1:10
    results = PSO(config, functionWrapper);
    iterationsArray = [iterationsArray, results.iterations];
    invocationsArray = [invocationsArray, results.functionInvocations];
    bestresultArray = [bestresultArray, results.bestValue];
end

for it=1:10
    totalIterations = totalIterations + iterationsArray(it);
    totalInvocations = totalInvocations + invocationsArray(it);
    totalresults = totalresults + bestresultArray(it);
    if minResult > bestresultArray(it)
        minResult = bestresultArray(it);
    end
    if maxResult < bestresultArray(it)
        maxResult = bestresultArray(it);
    end
    if minIterations > iterationsArray(it)
        minIterations = iterationsArray(it);
    end
    if maxIterations < iterationsArray(it)
        maxIterations = iterationsArray(it);
    end
    if minInvocations > invocationsArray(it) 
        minInvocations = invocationsArray(it);
    end
    if maxInvocations < invocationsArray(it)
        maxInvocations = invocationsArray(it);
    end
end

totalIterations = totalIterations/10;
totalInvocations = totalInvocations/10;

disp('Per 10 runs:');
disp('Lowest iteration count: ');
disp(minIterations);
disp('Average iteration count: ');
disp(totalIterations);
disp('Highest iteration count: ');
disp(maxIterations);
disp('Lowest invocations count: ');
disp(minInvocations);
disp('Average invocations count: ');
disp(totalInvocations);
disp('Highest invocations count: ');
disp(maxInvocations);
disp('Lowest value result found: ');
disp(minResult);
disp('Average best global result: ');
disp(totalresults/10);
disp('Highest value result found: ');
disp(maxResult);