classdef PlotService < handle    
    methods
        %Params ex.: drawFunction = graphWrapper; XRange = [-5 5]; YRange = [-5 5];
        %zRange = [0 80]; xLabel = 'x'; yLabel = 'y'; zLabel = 'z'; figureTitle = 'Figure'; numberOfColors = 50;
        function figure3D(obj, drawFunction, XRange, YRange, ZRange, xLabel, yLabel, zLabel, figureTitle, numberOfColors)         
            fsurf(drawFunction)
            hold on
            ylim(YRange)
            xlim(XRange)
            zlim(ZRange)
            title(figureTitle);
            xlabel(xLabel)
            ylabel(yLabel)
            zlabel(zLabel)
            hold off;
            colormap(jet(numberOfColors))
            colorbar
        end
        
        %Params ex.: iteration = 1; XRange = [-5 5]; YRange = [-5 5]; xLabel = 'x'; yLabel = 'y'; levelStep = 4; numberOfColors = 50;
        function figureByIteration(obj, iteration, results, graphWrapper, XRange, YRange, xLabel, yLabel, levelStep, numberOfColors)
            fcontour(graphWrapper, 'fill', 'off', "XRange", XRange, "YRange", YRange, "LevelStep", levelStep)
            hold on
            plot(results.pointsHistory(:, 1, iteration), results.pointsHistory(:, 2, iteration), 'r*')
            hold on
            ylim(YRange)
            xlim(XRange)
            title(['Iteration ' num2str(iteration) ' | Best ' num2str(results.bestValueHistory(iteration))]);
            xlabel(xLabel)
            ylabel(yLabel)
            hold off;
            colormap(jet(numberOfColors))
            colorbar
        end

        %Params ex.: XRange = [-5 5]; YRange = [-5 5]; xLabel = 'x'; yLabel = 'y'; levelStep = 4;
        %numberOfColors = 50; fileName = 'figure.gif'; timeBetweenAnimationFrames = 0.2, type = 'gif'
        function createGif(obj, results, graphWrapper, XRange, YRange, xLabel, yLabel, levelStep, numberOfColors, fileName, timeBetweenAnimationFrames, type)
            for i=1:results.iterations
                fcontour(graphWrapper, 'fill', 'off', "XRange", XRange, "YRange", YRange, "LevelStep", levelStep)
                hold on
                plot(results.pointsHistory(:, 1, i), results.pointsHistory(:, 2, i), 'r*')
                hold on
                ylim(YRange)
                xlim(XRange)
                title(['Iteration ' num2str(i) ' | Best ' num2str(results.bestValueHistory(i))]);
                xlabel(xLabel)
                ylabel(yLabel)
                hold off;
                colormap(jet(numberOfColors))
                colorbar

                drawnow; 
                frame = getframe(1);
                im = frame2im(frame);
                [imind,cm] = rgb2ind(im,256);
                if i == 1
                  imwrite(imind, cm, fileName, type, 'Loopcount', inf, 'DelayTime', timeBetweenAnimationFrames);
                else
                  imwrite(imind, cm, fileName, type, 'WriteMode', 'append', 'DelayTime', timeBetweenAnimationFrames);
                end
            end
        end
    end
end
