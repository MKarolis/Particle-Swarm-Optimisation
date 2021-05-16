functionWrapper = @(X) (bokachevskyFunction(X(1), X(2))); 
% Populate configuration
config = PsoConfig();
config.bounds = [-100 100];
config.dimensions = 2;
config.particleCount = 25;
config.maxIterations = 100;
config.targetAccuracy = 10^-6;
config.inertiaCoefficient = 0.5;
config.cognitiveCoefficient = 0.85;
config.socialCoefficient = 0.7;
config.dampingCoefficient = 0.95;

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

% Plot results
graphWrapper = @(X1, X2) (bokachevskyFunction(X1, X2));
plotService = PlotService();
figure();
%plotService.createGif(results, graphWrapper, [-1 1], [-1 1], 'x', 'y', 0.1, 50, 'figure.gif', 0.2, 'gif');
figure();
%plotService.figureByIteration(1, results, graphWrapper, config.bounds, config.bounds, 'x', 'y', 4, 100);
figure();
if rem(results.iterations, 2) == 1
%plotService.figureByIteration((results.iterations+1)/2, results, graphWrapper, [-1 1], [-1 1], 'x', 'y', 0.1, 100);
else
%plotService.figureByIteration(results.iterations/2, results, graphWrapper, [-1 1], [-1 1], 'x', 'y', 0.1, 100);
end
figure();
%plotService.figureByIteration(results.iterations, results, graphWrapper, [-0.000001 0.0000001], [-0.000001 0.0000001], 'x', 'y', 0.00001, 100);
figure();
%plotService.figure3D(graphWrapper, config.bounds, config.bounds, [0 30000], 'x', 'y', 'z', 'Bokachevsky', 200)
%figureByIteration(obj, iteration, results, graphWrapper, XRange, YRange, xLabel, yLabel, levelStep, numberOfColors)