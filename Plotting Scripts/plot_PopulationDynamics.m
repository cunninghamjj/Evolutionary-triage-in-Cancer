%% Plot population dynamics over time.

figure
plot(outputStats.population, 'k', 'LineWidth', 4)

%Format plot
xlabel('Time (generations)', 'FontSize', 20);
ylabel('Population', 'FontSize', 20);
title('Population Dynamics', 'FontSize', 24);
set(gca, 'FontSize',16);

box on
xlim([0 maxSimTime])
ylim([0 maxNumberOfCells])

