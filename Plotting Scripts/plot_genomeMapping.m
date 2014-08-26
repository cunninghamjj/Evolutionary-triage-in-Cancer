
boundary1 = (1 - p_range.^alpha1).^(1/beta1);
boundary2 = (1 - p_range.^alpha2).^(1/beta2);

figure

subplot(2, 2, 1)
plot(mappedP_unbounded, mappedS_unbounded, '.k', 'MarkerSize', 3);
hold on
plot(p_range, boundary1, 'k', 'LineWidth', 2)
plot(startingP, startingS, 'pr', 'MarkerFaceColor', 'r', 'MarkerSize', 12);
xlim([-1 2])
ylim([-1 2])
axis square
xlabel('Fecundity (p)', 'FontSize', 16);
ylabel('Survivorship (S)', 'FontSize', 16);
title('Unbounded Genomes', 'FontSize', 20);
set(gca, 'FontSize', 12); 

subplot(2, 2, 2)
plot(plotp, plotS, '.k', 'MarkerSize', 3);
hold on
plot(startingP, startingS, 'pr', 'MarkerFaceColor', 'r', 'MarkerSize', 12);
xlim([0 1])
ylim([0 1])
axis square
xlabel('Fecundity (p)', 'FontSize', 16);
ylabel('Survivorship (S)', 'FontSize', 16);
title('Bounded Genomes', 'FontSize', 20);
set(gca, 'FontSize', 12); 

subplot(2, 2, 3)
plot(mappedP_ESS1, mappedS_ESS1, '.k', 'MarkerSize', 3);
hold on
plot(p_range, boundary1, 'k', 'LineWidth', 2)
plot(startingP, startingS, 'pr', 'MarkerFaceColor', 'r', 'MarkerSize', 12);
xlim([0 1])
ylim([0 1])
axis square
xlabel('Fecundity (p)', 'FontSize', 16);
ylabel('Survivorship (S)', 'FontSize', 16);
title('Reflected for Boundary 1', 'FontSize', 20);
set(gca, 'FontSize', 12); 

subplot(2, 2, 4)
plot(mappedP_ESS2, mappedS_ESS2, '.k', 'MarkerSize', 3);
hold on
plot(p_range, boundary2, 'k', 'LineWidth', 2)
plot(startingP, startingS, 'pr', 'MarkerFaceColor', 'r', 'MarkerSize', 12);
xlim([0 1])
ylim([0 1])
axis square
xlabel('Fecundity (p)', 'FontSize', 16);
ylabel('Survivorship (S)', 'FontSize', 16);
title('Reflected for Boundary 2', 'FontSize', 20);
set(gca, 'FontSize', 12); 