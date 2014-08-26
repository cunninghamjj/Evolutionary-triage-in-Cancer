%% Double bind treatment

if (time == 1)
    
    annoyingTherapyTime = 1;
    
    
%     % Which treatment strategy are we doing here.
%     if (outputStats(run).withGeneCount(time-1, 16)/outputStats(run).population(time-1) > 0.95)
%         %Then start targeted therapy immediately.
%         targetedTherapyTime = 500;
%         
%     else
%         %Then do annoying, then targeted at 700.
%         annoyingTherapyTime = 500;
%         targetedTherapyTime = 700;
%                 
%     end
end



if (time > targetedTherapyTime)
    
    %Does this cell have the gene.
    tf = sum(cells(i).mutations == targetedGeneToRegulate_Down);
    
    if(tf == 1)
        %If yes, it has a % efficacy of dying.
        if(rand < 0.25)
            
            %Set these to infinity so the cell dies during the
            %mutation if cycle.
            cells(i).p = 0;
            cells(i).S = 0;
            
        end
        
    end
    
end


if (time > annoyingTherapyTime && cells(i).p ~= 0)
    
    if(rand < 0.25) %% Add annoying mutations to genome
        
        myMutations = cells(i).mutations;
        changedGenomeFlag = 0;
        
        for k = 1:1:numel(targetedGeneToRegulate_Up) % Add the treatment genes to the genome.
            
            loc = find(myMutations == targetedGeneToRegulate_Up(k));
            
            if (isempty(loc))
                changedGenomeFlag = 1;
                myMutations(1) = targetedGeneToRegulate_Up(k);
                myMutations = sort(myMutations);
            end
            
        end
        
        if(changedGenomeFlag == 1)
            for compRow = 1:1:size(combinations, 1)
                if(myMutations == combinations(compRow, :))
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
    
end





