
%% Create a new cell with the possibility of mutation.

% Determine if a mutation is occuring.
if( rand < mutationRate )
    
    % Create new genome vectors beginning with old genome as base.
    myNewMutations = cells(i).mutations;
    myNewNeutralMutations = cells(i).neutralMutations;
    
    % Choose which gene to mutate from all types of genes.
    newMutation = randi([1, nGenes + nNeutralGenes + nLethalGenes]);
    
    % If new mutation is one of the (deltaP, deltaS) genes.
    if (newMutation <= nGenes)
        
        % Does this cell already have this mutation?
        loc = find(cells(i).mutations == newMutation);

        % Change state of gene in genome
        if (isempty(loc))
            myNewMutations(1) = newMutation;
        else
            myNewMutations(loc) = 0;
        end
        
        % Sort mutation vector
        sortedNewMutations = sort(myNewMutations);
        
        % Identify genome index.
        for compRow = 1:1:size(genomes, 1)
            if(sortedNewMutations == genomes(compRow, :))
                break;
            end
        end
        
        % Create new cell and add it to new cells
        newCells(size(newCells, 2) + 1).mutations = sortedNewMutations;
        newCells(size(newCells, 2)).neutralMutations = cells(i).neutralMutations;
        newCells(size(newCells, 2)).S = mappedS(compRow);
        newCells(size(newCells, 2)).p = mappedP(compRow);
        newCells(size(newCells, 2)).plotS = plotS(compRow);
        newCells(size(newCells, 2)).plotp = plotp(compRow);
        newCells(size(newCells, 2)).combination = compRow;
        
    %If new mutation is one of the neutral genes.
    elseif (newMutation <= nGenes + nNeutralGenes)
        
        % Determine which neutral gene.
        neutralMutation = newMutation - nGenes; 
        
        % Change state of neutral gene in genome.
        if (myNewNeutralMutations(neutralMutation) == 0)
            myNewNeutralMutations(neutralMutation) = 1;
        else
            myNewNeutralMutations(neutralMutation) = 0;
        end
        
        % Create new cell and add it to new cells
        newCells(size(newCells, 2) + 1).mutations = cells(i).mutations;
        newCells(size(newCells, 2)).neutralMutations = myNewNeutralMutations;
        newCells(size(newCells, 2)).S = cells(i).S;
        newCells(size(newCells, 2)).p = cells(i).p;
        newCells(size(newCells, 2)).plotS = cells(i).plotS;
        newCells(size(newCells, 2)).plotp = cells(i).plotp;
        newCells(size(newCells, 2)).combination = cells(i).combination;
        
    else
        % Lethal mutation. No new cells are added to newCells. Log lethal.
        totalLethalMutations = totalLethalMutations + 1;
    end
    
    
else
    % No mutation occured. Copy orignal cell to new cells.
    newCells(size(newCells, 2) + 1).mutations = cells(i).mutations;
    newCells(size(newCells, 2)).neutralMutations = cells(i).neutralMutations;
    newCells(size(newCells, 2)).S = cells(i).S;
    newCells(size(newCells, 2)).p = cells(i).p;
    newCells(size(newCells, 2)).plotS = cells(i).plotS;
    newCells(size(newCells, 2)).plotp = cells(i).plotp;
    newCells(size(newCells, 2)).combination = cells(i).combination;
    
end