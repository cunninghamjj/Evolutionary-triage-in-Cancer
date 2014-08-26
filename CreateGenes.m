function [deltaP, deltaS] = CreateGenes(nGenes)

if (nGenes == 4)
    % Create 1 gene in each quadrant
    
    % Set baseline grid for (deltaP, deltaS) genes
    [deltaP, deltaS] = meshgrid(linspace(-0.15, 0.15, 2), linspace(-0.15, 0.15, 2));
    
    
elseif (nGenes == 8)
    % Create 2 genes in each quadrant
    
    % Set baseline grid for (deltaP, deltaS) genes
    deltaP = [-0.15, 0.15, -0.05, 0.05, -0.05, 0.05, -0.15, 0.15];
    deltaS = [0.15, 0.15, 0.05, 0.05, -0.05, -0.05, -0.15, -0.15];
    
    
elseif (nGenes == 12)
    % Create 3 genes in each quadrant
    
    % Set baseline grid for (deltaP, deltaS) genes
    deltaP = [-0.05, 0.05, -0.15, -0.05, 0.05, 0.15, -0.15, -0.05, 0.05, 0.15, -0.05, 0.05];
    deltaS = [0.15, 0.15, 0.05, 0.05, 0.05, 0.05, -0.05, -0.05, -0.05, -0.05, -0.15, -0.15];
    
    
elseif (nGenes == 16)
    % Create 4 genes in each quadrant
    
    % Set baseline grid for (deltaP, deltaS) genes
    [deltaP, deltaS] = meshgrid(linspace(-0.15, 0.15, 4), linspace(-0.15, 0.15, 4));
    
    
elseif (nGenes == 20)
    % Create 5 genes in each quadrant
    
    % Set baseline grid for (deltaP, deltaS) genes
    deltaP = [-0.15, -0.05, 0.05, 0.15, -0.1, 0.1, -0.15, -0.05, 0.05, 0.15, -0.15, -0.05, 0.05, 0.15, -0.1, 0.1, -0.15, -0.05, 0.05, 0.15];
    deltaS = [0.15, 0.15, 0.15, 0.15, 0.1, 0.1, 0.05, 0.05, 0.05, 0.05, -0.05, -0.05, -0.05, -0.05, -0.1, -0.1, -0.15, -0.15, -0.15, -0.15];
    
    
end

% Calculate quiver for randomness
quiverS = (-1 + 2 .* rand(size(deltaS))) .* 0.05;
quiverP = (-1 + 2 .* rand(size(deltaP))) .* 0.05;

% Apply quiver
deltaS = deltaS + quiverS;
deltaP = deltaP + quiverP;