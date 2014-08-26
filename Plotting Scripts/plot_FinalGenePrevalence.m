%% Plot final (deltaP, deltaS) gene prevalence

figure
bar(1:nGenes, outputStats.withGeneCount(end, :), 'k')

%Format plot
xlabel('Gene', 'FontSize', 20);
ylabel('# Cells with Gene Mutation', 'FontSize', 20);
title('Final Population Gene Prevalence', 'FontSize', 24);
set(gca, 'FontSize',16);

set(gca,'XTick',1:16)
set(gca,'YTick',[0 500])

xlim([0 nGenes+1])
ylim([0 maxNumberOfCells])
box on


