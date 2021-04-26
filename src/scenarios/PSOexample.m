functionWrapper = @(X) (rastriginFunction(X(1), X(2)));
% Populate configuration
config = PsoConfig();
config.bounds = [-5 5];
config.dimensions = 2;
config.particleCount = 50;
config.maxIterations = 50;
config.targetAccuracy = 10^-10;
config.inertiaCoefficient = 0.5;
config.cognitiveCoefficient = 0.7;
config.socialCoefficient = 0.7;
config.dampingCoefficient = 0.99;

% Execute PSO
results = PSO(config, functionWrapper);

% Plot results
graphWrapper = @(X1, X2) (rastriginFunction(X1, X2));
plotService = PlotService();
plotService.createGif(results, graphWrapper, config.bounds, config.bounds, 'x', 'y', 4, 50, 'figure.gif', 0.2, 'gif');
