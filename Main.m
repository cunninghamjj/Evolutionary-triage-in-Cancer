% clear('all')
% close('all')
% clc

%% Parameters

% Simulation
maxSimTime = 1000;
numberOfRuns = 5;

% Set number of different types of genes
nGenes = 8; %(4, 8, 12, 16, 20)
nNeutralGenes = 4;
nLethalGenes = 2;

% Select starting point
startIndex = 1; %(1, 2, 3)

% Select ESS
ESS = '2'; %('1', '2', 'Switch')
[switchESSTime] = CalculateSwitchTime(ESS, maxSimTime);

% Population dynamics
numberOfCells = 250;
maxNumberOfCells = 500;

% Mutation dynamics
mutationRate = 0.01;

% Set targeted therapy parameters
targetedGene = 16;
targetedTherapyTime = 500;
targetedTreatmentEfficacy = 0.25;

% Set never mutation therapy parameters
neverGene = 1;
neverTherapyTime = inf; %300
neverTreatmentEfficacy = 0.25;

completeEradication = 0;


%% Create Genes

% 1) Load prefabricated 16 genes from manuscripe (uncomment line below)
disp('Loading genes...')
load ([pwd '\Prefab Parameters\ManuscriptGenes.mat'])
% OR
% 2) Create new random genes (uncomment line below)
disp('Creating genes...')
% [deltaP, deltaS] = CreateGenes(nGenes);


%% Create Genomes
[totalDeltaP, totalDeltaS, genomes] = CreateGenomes(nGenes, deltaP, deltaS);


%% Create simulation space
load([pwd '\Prefab Parameters\StartPoints.mat'])
disp('Creating simulation space...')
CreateSimulationSpace;


%% Map genomes from starting point
disp('Mapping genomes...')
% [mappedP_unbounded, mappedS_unbounded, mappedP_ESS1, mappedS_ESS1, mappedP_ESS2, mappedS_ESS2, plotp, plotS] = MapGenomes(startingP(startIndex), startingS(startIndex), totalDeltaP, totalDeltaS, alpha1, alpha2, beta1, beta2 );
load([pwd '\Prefab Parameters\StartPoint1_MappedGenomes.mat'])
% load([pwd '\Prefab Parameters\StartPoint2_MappedGenomes.mat'])
% load([pwd '\Prefab Parameters\StartPoint3_MappedGenomes.mat'])


%% Find theoretical best genome (exploratory)
disp('Finding best theoretical genome...')
[requiredChange, bestGenomeIndex, bestGenome] = CalculateBestGenome(genomes, totalDeltaP, totalDeltaS, p_ESS1, p_ESS2, S_ESS1, S_ESS2, startingP, startingS );


% Run Simulation
for run = 1:1:numberOfRuns
    
    disp([run completeEradication])
    
    % Reset all variables.
    cells = struct([]);
    
    targetedTherapyFlag = 0;
    neverTherapyFlag = 0;
    
    % Set up cells matrix
    [cells(1:numberOfCells).mutations] = deal(zeros(1, nGenes));
    [cells(1:numberOfCells).neutralMutations] = deal(zeros(1, nNeutralGenes));
    [cells(1:numberOfCells).p] = deal(startingP(startIndex));
    [cells(1:numberOfCells).S] = deal(startingS(startIndex));
    [cells(1:numberOfCells).plotp] = deal(startingP(startIndex));
    [cells(1:numberOfCells).plotS] = deal(startingS(startIndex));
    [cells(1:numberOfCells).combination] = deal(ones(1, 1));
    
    totalLethalMutations = 0;
    
    % Cycle through Generations
    time = 0;
    while (time < maxSimTime)
        
        %Begin new generation.
        time = time + 1;
        
        %Disp running stats to command window.
        genesToSee = [1 8 16];
        if(time > 1)
%             fprintf('%d\t %d\t %d\t %5.2f\t %5.2f\t %5.2f\t  \n', run, time, length(cells), 100 .* outputStats.withGeneCount(time-1, genesToSee) ./ outputStats.population(time-1));
        end
        
        %Define which ESS we are in.
        if (time <= switchESSTime)
            mappedP = mappedP_ESS1;
            mappedS = mappedS_ESS1;
        else
            mappedP = mappedP_ESS2;
            mappedS = mappedS_ESS2;
        end
        
        %Is the targeted therapy on driver mutation being applied
        if (time == targetedTherapyTime - 1)
            targetedTherapyFlag = 1;
        end
        
        %Is the never mutation upregulation being applied
        if (time == neverTherapyTime - 1)
            neverTherapyFlag = 1;
        end
                
        %% Create new empty cell structure
        newCells = struct([]);
        
        %Cycle through all cells
        for i = 1:1:size(cells, 2)
            
            %Apply targeted therapy.
            if (targetedTherapyFlag == 1)
                Treatment_DownregulateDriver;
            end
            
            %Apply never upregulation therapy.
            if (neverTherapyFlag == 1)
                Treatment_UpregulateNever;
            end
            
            % Random p and S between [0, 1]
            randp = rand;
            randS = rand;
            
            if( randp < cells(i).p && randS < cells(i).S )
                % Create two new cells, both with mutations.
                OneNewCell_OneMutations;
                OneNewCell_OneMutations;
                
            elseif( randp >= cells(i).p && randS < cells(i).S )
                % The original cells survives but does not proliferate. No mutations occur.
                OneNewCell_NoMutations;
                
            elseif( randp < cells(i).p && randS >= cells(i).S )
                % Half of the time both die, other half a new daughter is
                % made but the original cell dies.
                if (rand < 0.5)
                    % One new cell makes it to next generation with mutation.
                    OneNewCell_OneMutations;
                    
                else
                    % No cells make it to next generation.
                end
                
            else
                % No new cells make it to next generation.
            end
        end
        
        % If all the cells have died, continue directly to plotting.
        if (isempty(newCells))
            completeEradication = completeEradication + 1;
            break;
        end
        
        %% Hard cap population at maxNumberOfCells.
        if ( size(newCells, 2) >= maxNumberOfCells )
            
            %How many cells are in the population now.
            sizeNewCells = size(newCells, 2);
            
            %Create random permutation of indexes for number of new cells
            indexPermutation = randperm(sizeNewCells);
            
            %Repopulate new cells structure with first maxNumberOfCells indeces.
            cells = struct([]);
            cells = newCells(indexPermutation(1:maxNumberOfCells));
            
        else
            %Repopulate new cells structure with all newCells.
            cells = struct([]);
            cells = newCells;
        end
        
        % Log population.
        outputStats.population(time) = size(cells, 2);
        
        
        %% Extract individual cell mutation status
        outputStats.withGeneCount(time, :) = zeros(1, nGenes);
        for index = 1:1:size(cells,2)
            for gene = 1:1:nGenes
                
                tf = sum(cells(index).mutations == gene);
                if(tf == 1)
                    outputStats.withGeneCount(time, gene) = outputStats.withGeneCount(time, gene) + 1;
                end
            end
        end
        
        
        %% Extract individual cell neutral mutation status
        outputStats.neutralCount(time,:) = zeros(1, nNeutralGenes);
        
        allNeutralMutations = reshape([cells.neutralMutations], length(cells), nNeutralGenes);
        for index = 1:1:nNeutralGenes
            outputStats.neutralCount(time, index) = sum(allNeutralMutations(:,index));
        end
        
        
        %% Extract lethal mutations
        outputStats.lethalCount(time) = totalLethalMutations;
        
        
        %% Calculate Simpsons Index of Diversity
        
        % Get table of all genomes within the population
        allCombinations = [cells.combination];
        TABLE = tabulate(allCombinations);
        noZeroIndex = find(TABLE(:,2) >0);
        noZeroTABLE = TABLE(noZeroIndex,:);
        
        % Log all genotype prevalences and number of unique genotypes.
        outputStats.GenotypePrevalences(time) = {noZeroTABLE};
        outputStats.numberOfGenotypes(time) = size(noZeroTABLE, 1);
        
        % Calculate and log Simpsons Index.
        simpsonData = noZeroTABLE(:,2);
        outputStats.SimpsonsIndexOfDiversity(time) = 1 - ( sum(simpsonData.*(simpsonData-1))/(sum(simpsonData) * (sum(simpsonData)-1)) );
        
        
        %% Log average population phenotype
        
        % Here we used the original (p,S) instead of the reflected (p,S)
        % around the mutational boundary used for calculating fitness as
        % it showed more truly where the population phenotype was
        % centered. Otherwise the centers were skewed towards below the
        % mutational boundary.
        
        outputStats.centerX(time) = mean([cells.plotp]);
        outputStats.centerY(time) = mean([cells.plotS]);
        
        
        
    end % generation
    
end % run



%% Plot everything.

% Plot individual (deltaP, deltaS)
% plot_DeltaPDeltaS( deltaP, deltaS, nGenes )

% Plot genome (detlaP, deltaS)
% plot_GenomeDeltaPDeltaS;

% Plot evolution of bounded and reflected genome (p, S)
% plot_genomeMapping;

% Plot simulation space
% plot_SimulationSpace;

% Plot population dynamics
% plot_PopulationDynamics;

% Plot evolutionary trajectory
% plot_EvolutionaryTrajectory;

% Plot Simpsons Index of Diversity
% plot_SimpsonsIndexOfDiversity;

% Plot final gene prevalence
% plot_FinalGenePrevalence;

% Plot gene prevalence over time
% plot_GenePrevalenceOverTime;


