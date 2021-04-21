classdef Particle
    
    properties
        position;
        velocity;
        value;
        bestPosition;
        bestValue;
    end
    
    methods
        function particle = Particle()
            particle.position = [];
            particle.velocity = [];
            particle.value = inf;
            particle.bestPosition = [];
            particle.bestValue = inf;
        end
    end
end

