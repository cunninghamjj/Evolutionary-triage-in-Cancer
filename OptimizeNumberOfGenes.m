%% Create 1 gene in each quadrant
nGenes = 4;

% Set baseline grid for (deltaP, deltaS) genes
[deltaP, deltaS] = meshgrid(linspace(-0.15, 0.15, 2), linspace(-0.15, 0.15, 2));

% Calculate quiver for randomness
quiverS = (-1 + 2 .* rand(size(deltaS))) .* 0.05;
quiverP = (-1 + 2 .* rand(size(deltaP))) .* 0.05;

% Apply quiver
deltaS = deltaS + quiverS;
deltaP = deltaP + quiverP;

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
title('Individual Gene Mutations', 'FontSize', 24)


%% Create 2 genes in each quadrant
nGenes = 8;

% Set baseline grid for (deltaP, deltaS) genes
deltaP = [-0.15, 0.15, -0.05, 0.05, -0.05, 0.05, -0.15, 0.15];
deltaS = [0.15, 0.15, 0.05, 0.05, -0.05, -0.05, -0.15, -0.15];

% Calculate quiver for randomness
quiverS = (-1 + 2 .* rand(size(deltaS))) .* 0.05;
quiverP = (-1 + 2 .* rand(size(deltaP))) .* 0.05;

% Apply quiver
deltaS = deltaS + quiverS;
deltaP = deltaP + quiverP;

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
title('Individual Gene Mutations', 'FontSize', 24)

%% Create 3 genes in each quadrant
nGenes = 12;

% Set baseline grid for (deltaP, deltaS) genes
deltaP = [-0.05, 0.05, -0.15, -0.05, 0.05, 0.15, -0.15, -0.05, 0.05, 0.15, -0.05, 0.05];
deltaS = [0.15, 0.15, 0.05, 0.05, 0.05, 0.05, -0.05, -0.05, -0.05, -0.05, -0.15, -0.15];

% Calculate quiver for randomness
quiverS = (-1 + 2 .* rand(size(deltaS))) .* 0.05;
quiverP = (-1 + 2 .* rand(size(deltaP))) .* 0.05;

% Apply quiver
deltaS = deltaS + quiverS;
deltaP = deltaP + quiverP;

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
title('Individual Gene Mutations', 'FontSize', 24)


%% Create 4 genes in each quadrant
nGenes = 16;

% Set baseline grid for (deltaP, deltaS) genes
[deltaP, deltaS] = meshgrid(linspace(-0.15, 0.15, 4), linspace(-0.15, 0.15, 4));

% Calculate quiver for randomness
quiverS = (-1 + 2 .* rand(size(deltaS))) .* 0.05;
quiverP = (-1 + 2 .* rand(size(deltaP))) .* 0.05;

% Apply quiver
deltaS = deltaS + quiverS;
deltaP = deltaP + quiverP;

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
title('Individual Gene Mutations', 'FontSize', 24)
title('Individual Gene Mutations', 'FontSize', 24)

%% Create 5 genes in each quadrant
nGenes = 20;

% Set baseline grid for (deltaP, deltaS) genes
deltaP = [-0.15, -0.05, 0.05, 0.15, -0.1, 0.1, -0.15, -0.05, 0.05, 0.15, -0.15, -0.05, 0.05, 0.15, -0.1, 0.1, -0.15, -0.05, 0.05, 0.15];
deltaS = [0.15, 0.15, 0.15, 0.15, 0.1, 0.1, 0.05, 0.05, 0.05, 0.05, -0.05, -0.05, -0.05, -0.05, -0.1, -0.1, -0.15, -0.15, -0.15, -0.15];  

% Calculate quiver for randomness
quiverS = (-1 + 2 .* rand(size(deltaS))) .* 0.05;
quiverP = (-1 + 2 .* rand(size(deltaP))) .* 0.05;

% Apply quiver
deltaS = deltaS + quiverS;
deltaP = deltaP + quiverP;

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
title('Individual Gene Mutations', 'FontSize', 24)
title('Individual Gene Mutations', 'FontSize', 24)


%% Create 6 genes in each quadrant
nGenes = 24;

% Set baseline grid for (deltaP, deltaS) genes
[deltaP, deltaS] = meshgrid(linspace(-0.15, 0.15, 4), linspace(-0.15, 0.15, 6));

% Calculate quiver for randomness
quiverS = (-1 + 2 .* rand(size(deltaS))) .* 0.05;
quiverP = (-1 + 2 .* rand(size(deltaP))) .* 0.05;

% Apply quiver
deltaS = deltaS + quiverS;
deltaP = deltaP + quiverP;

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
title('Individual Gene Mutations', 'FontSize', 24)
title('Individual Gene Mutations', 'FontSize', 24)


