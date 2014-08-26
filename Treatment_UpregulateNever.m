
%% Upregulate never mutation to genome neverTreatmentEfficacy percent of
% the time.

if(rand < neverTreatmentEfficacy) 
    
    myMutations = cells(i).mutations;

    loc = find(myMutations == neverGene);
        
    % If the never mutation is not already mutated, add it to the
    % genome
    if (isempty(loc))
        myMutations(1) = neverGene;
        myMutations = sort(myMutations);
                
        for compRow = 1:1:size(genomes, 1)
            if(myMutations == genomes(compRow, :))
                break;
            end
        end
        
        cells(i).mutations = myMutations;
        cells(i).neutralMutations = cells(i).neutralMutations;
        cells(i).S = mappedS(compRow);
        cells(i).p = mappedP(compRow);
        cells(i).plotS = plotS(compRow);
        cells(i).plotp = plotp(compRow);
        cells(i).combination = compRow;
    end
    
end


