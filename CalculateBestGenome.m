
function [requiredChange, bestGenomeIndex, bestGenome] = bestGenome(combinations, totalDeltaP, totalDeltaS, p_ESS1, p_ESS2, S_ESS1, S_ESS2, startingP, startingS );


% Determine required (deltaP, deltaS) for each scenario.
requiredChange.SP1ESS1 = [p_ESS1 - startingP(1) S_ESS1 - startingS(1)];
requiredChange.SP2ESS1 = [p_ESS1 - startingP(2) S_ESS1 - startingS(2)];
requiredChange.SP3ESS1 = [p_ESS1 - startingP(3) S_ESS1 - startingS(3)];
requiredChange.SP1ESS2 = [p_ESS2 - startingP(1) S_ESS2 - startingS(1)];
requiredChange.SP2ESS2 = [p_ESS2 - startingP(2) S_ESS2 - startingS(2)];
requiredChange.SP3ESS2 = [p_ESS2 - startingP(3) S_ESS2 - startingS(3)];


%% SP1ESS1
distancesFromRequired = sqrt( (totalDeltaP - requiredChange.SP1ESS1(1)).^2 + (totalDeltaS - requiredChange.SP1ESS1(2)).^2 );
minimumIndex = find(distancesFromRequired == min(distancesFromRequired));
minimumDistanceCombination = combinations(minimumIndex, :);

bestGenomeIndex.SP1ESS1 =  minimumIndex;
bestGenome.SP1ESS1 = minimumDistanceCombination;


%% SP2ESS1
distancesFromRequired = sqrt( (totalDeltaP - requiredChange.SP2ESS1(1)).^2 + (totalDeltaS - requiredChange.SP2ESS1(2)).^2 );
minimumIndex = find(distancesFromRequired == min(distancesFromRequired));
minimumDistanceCombination = combinations(minimumIndex, :);

bestGenomeIndex.SP2ESS1 =  minimumIndex;
bestGenome.SP2ESS1 = minimumDistanceCombination;


%% SP3ESS1
distancesFromRequired = sqrt( (totalDeltaP - requiredChange.SP3ESS1(1)).^2 + (totalDeltaS - requiredChange.SP3ESS1(2)).^2 );
minimumIndex = find(distancesFromRequired == min(distancesFromRequired));
minimumDistanceCombination = combinations(minimumIndex, :);

bestGenomeIndex.SP3ESS1 =  minimumIndex;
bestGenome.SP3ESS1 = minimumDistanceCombination;


%% SP1ESS2
distancesFromRequired = sqrt( (totalDeltaP - requiredChange.SP1ESS2(1)).^2 + (totalDeltaS - requiredChange.SP1ESS2(2)).^2 );
minimumIndex = find(distancesFromRequired == min(distancesFromRequired));
minimumDistanceCombination = combinations(minimumIndex, :);

bestGenomeIndex.SP1ESS2 =  minimumIndex;
bestGenome.SP1ESS2 = minimumDistanceCombination;


%% SP2ESS2
distancesFromRequired = sqrt( (totalDeltaP - requiredChange.SP2ESS2(1)).^2 + (totalDeltaS - requiredChange.SP2ESS2(2)).^2 );
minimumIndex = find(distancesFromRequired == min(distancesFromRequired));
minimumDistanceCombination = combinations(minimumIndex, :);

bestGenomeIndex.SP2ESS2 =  minimumIndex;
bestGenome.SP2ESS2 = minimumDistanceCombination;


%% SP3ESS2
distancesFromRequired = sqrt( (totalDeltaP - requiredChange.SP3ESS2(1)).^2 + (totalDeltaS - requiredChange.SP3ESS2(2)).^2 );
minimumIndex = find(distancesFromRequired == min(distancesFromRequired));
minimumDistanceCombination = combinations(minimumIndex, :);

bestGenomeIndex.SP3ESS2 =  minimumIndex;
bestGenome.SP3ESS2 = minimumDistanceCombination;

