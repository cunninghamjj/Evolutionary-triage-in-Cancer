%% The drug kills treatmentEfficacy percent of cells with the mutation
% present.


% if(rand < targetedTreatmentEfficacy)
%     
%     myMutations = cells(i).mutations;
%     
%     loc = find(myMutations == targetedGene);
%     
%     % If the never mutation is not already mutated, add it to the
%     % genome
%     if (~isempty(loc))
%         myMutations(loc) = 0;
%         myMutations = sort(myMutations);
%         
%         for compRow = 1:1:size(genomes, 1)
%             if(myMutations == genomes(compRow, :))
%                 break;
%             end
%         end
%         
%         cells(i).mutations = myMutations;
%         cells(i).neutralMutations = cells(i).neutralMutations;
%         cells(i).S = mappedS(compRow);
%         cells(i).p = mappedP(compRow);
%         cells(i).plotS = plotS(compRow);
%         cells(i).plotp = plotp(compRow);
%         cells(i).combination = compRow;
%     end
%     
% end
% 



%Does this cell have the gene.
tf = sum(cells(i).mutations == targetedGene);

if(tf == 1)
    %If yes, it has a % efficacy of dying.
    if(rand < targetedTreatmentEfficacy)

        %Set these to 0 so the cell dies during the following cycle
        cells(i).p = 0;
        cells(i).S = 0;

    end

end



