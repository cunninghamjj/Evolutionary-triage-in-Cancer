%% Plot genome total (deltaP, deltaS)
figure
plot(totalDeltaP, totalDeltaS, 'pk', 'MarkerFaceColor', 'k', 'MarkerSize', 4)
hold on
plot([0 0], [-1.5 1.5], '--k', 'LineWidth', 2)
plot([-1.5 1.5], [0 0], '--k', 'LineWidth', 2)

hold off
axis square
grid off
ylabel('Change in Survivorship', 'FontSize', 20)
xlabel('Change in Fecundity', 'FontSize', 20)

set(gca,'YTick', -1:1:1)
set(gca,'XTick', -1:1:1)

xlim([-1 1])
ylim([-1 1])
set(gca, 'FontSize',16);
title([mat2str(2^nGenes), ' Genome (deltaS, deltaP)' ], 'FontSize', 24)