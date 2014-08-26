figure
hold on

%Plot first ESS boundary
h(1) = plot(p_range, boundary1, ':k', 'LineWidth', 4);
plot(p_ESS1, S_ESS1, 'pk', 'MarkerFaceColor', 'k', 'MarkerSize', 20)
text(p_ESS1, S_ESS1,['    ', 'ESS 1'], 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');

%Plot second ESS boundary
h(2) = plot(p_range, boundary2, '-.k', 'LineWidth', 4);
plot(p_ESS2, S_ESS2, 'pk', 'MarkerFaceColor', 'k', 'MarkerSize', 20)
text(p_ESS2, S_ESS2,['    ', 'ESS 2'], 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');

%Plot zero fitness boundary
h(3) = plot(p_range, zeroFitnessBoundary, 'k', 'LineWidth', 2);

%Plot starting points
h(4) = plot(startingP(1), startingS(1), '^k', 'MarkerFaceColor', 'k', 'MarkerSize', 14);
text(startingP(1), startingS(1),['   ', int2str(1)], 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');
plot(startingP(2), startingS(2), '^k', 'MarkerFaceColor', 'k', 'MarkerSize', 14)
text(startingP(2), startingS(2),['   ', int2str(2)], 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');
plot(startingP(3), startingS(3), '^k', 'MarkerFaceColor', 'k', 'MarkerSize', 14)
text(startingP(3), startingS(3),['   ', int2str(3)], 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');

axis square
xlabel('Fecundity (p)', 'FontSize', 20);
ylabel('Survivorship (S)', 'FontSize', 20);
title('Simulation Space', 'FontSize', 24);
set(gca, 'FontSize',16);

set(gca,'YTick',[0 [] 0.2 [] 0.4 [] 0.6 [] 0.8 1.0])
set(gca,'XTick',[0 [] 0.2 [] 0.4 [] 0.6 [] 0.8 1.0])

cellArray{1} = 'Trade-Off Boundary 1';
cellArray{2} = 'Trade-Off Boundary 2';
cellArray{3} = 'Sustainable Population Boundary';
cellArray{4} = 'Initial Phenotypes';

legend(h, cellArray, 'Location', 'SouthWest')
legend boxoff

box on
axis equal
xlim([0 1])
ylim([0.2 1])