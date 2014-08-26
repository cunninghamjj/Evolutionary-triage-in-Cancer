function [totalDeltaP, totalDeltaS, genomes] = CreateGenomes(nGenes, deltaP, deltaS)


%% Create matrix of all binary on/off combinations; aka genomes
genomes = zeros(1, nGenes);
genes = linspace(1, nGenes, nGenes);

for i = 1:1:nGenes
    
    a = combnk(genes,i);
    b = padarray(a, [0 (nGenes-size(a, 2))], 'pre');
    
    genomes = [genomes; b];
end


%% Calculate all genome total (deltaP, deltaS)
totalDeltaS = zeros(1, length(genomes));
totalDeltaP = zeros(1, length(genomes));

for i = 1:1:length(genomes)

    myCombo = genomes(i, :);

    genesON = myCombo(myCombo > 0);

    for j = genesON
        totalDeltaP(i) = totalDeltaP(i) + deltaP(j);
        totalDeltaS(i) = totalDeltaS(i) + deltaS(j);
    end

end


