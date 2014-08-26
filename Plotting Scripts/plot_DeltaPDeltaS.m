function [ ] = plotDeltaPDeltaS( deltaP, deltaS, nGenes )

% Plot (deltaP, deltaS) genes for visual check
plot(deltaP, deltaS, 'pk', 'MarkerFaceColor', 'k', 'MarkerSize', 16)
hold on
plot([0 0], [-1 1], ':k')
plot([-1 1], [0 0], ':k')

% Label genes for reference
for i = 1:1:nGenes
    text(deltaP(i), deltaS(i),['    ', int2str(i)], 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');
end

hold off
axis square
grid off
ylabel('Change in Survivorship','FontSize',20);
xlabel('Change in Fecundity','FontSize',20);
xlim([-0.25 0.25])
ylim([-0.25 0.25])
set(gca, 'FontSize',16);
title('Individual Gene (deltaP, deltaS)', 'FontSize', 24)

end

