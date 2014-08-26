%% Plot Simpsons Index of Diversity over time.

figure
plot(outputStats.SimpsonsIndexOfDiversity, 'k', 'LineWidth', 4)

%Format plot
xlabel('Time (generations)', 'FontSize', 20);
ylabel('Simpsons Index of Diversity', 'FontSize', 20);
title('Heterogeneity During Evolutionary Triage', 'FontSize', 24);
set(gca, 'FontSize',16);

set(gca,'YTick',[0 [] 0.2 [] 0.4 [] 0.6 [] 0.8 1.0])

box on
xlim([0 maxSimTime])
ylim([0 1])