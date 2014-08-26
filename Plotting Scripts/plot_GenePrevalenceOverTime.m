%% Plot mutation prevalence over time.

figure

%% Plot prevalence ofd (deltaP, deltaS) genes.
subplot(3, 1, 1)
s = smooth(outputStats.withGeneCount);
smoothed = reshape(s, size(outputStats.withGeneCount, 1), nGenes);
hb = plot(1:size(outputStats.withGeneCount, 1)-2, smoothed(3:size(outputStats.withGeneCount, 1), :), 'k');

displayString = {'1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; '10'; '11'; '12'; '13'; '14'; '15'; '16'};

set( hb, {'DisplayName'}, displayString(1:nGenes));

%Format plot.
title('Individual Gene Prevalence', 'FontSize', 20);
ylabel('# Cells with Gene Mutation', 'FontSize', 16);
set(gca, 'FontSize',12);
xlim([0 maxSimTime])
ylim([0 maxNumberOfCells])
box on


%% Plot prevalence of neutral mutations
subplot(3, 1, 2)
s = smooth(outputStats.neutralCount);
smoothed = reshape(s, size(outputStats.neutralCount, 1), nNeutralGenes);
hb = plot(1:size(outputStats.neutralCount, 1)-2, smoothed(3:size(outputStats.neutralCount, 1), :), 'k');
set( hb, {'DisplayName'}, {'1'; '2'; '3'; '4'} );

%Format plot.
title('Neutral Gene Prevalence', 'FontSize', 20);
ylabel('# Cells with Gene Mutation', 'FontSize', 16);
set(gca, 'FontSize',12);
xlim([0 maxSimTime])
ylim([0 maxNumberOfCells])
box on


%% Plot number of lethal mutations over time
subplot(3, 1, 3)
s = smooth(outputStats.lethalCount)';
hb = plot(1:size(outputStats.lethalCount, 2)-2, s(3:size(outputStats.lethalCount, 2)), 'k');

%Format plot.
title('Lethal Gene Deaths Over Time', 'FontSize', 20);
xlabel('Time (generations)', 'FontSize', 16);
ylabel('# Cell Deaths by Lethal', 'FontSize', 16);
set(gca, 'FontSize',12);
xlim([0 maxSimTime])
box on
