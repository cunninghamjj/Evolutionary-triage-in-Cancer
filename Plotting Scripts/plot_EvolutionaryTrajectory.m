%% This plots the average phenotype of the population over time throughout
% the simulation.

figure
hold on

%Plot Boundary 1
plot(p_range, boundary1, ':k', 'LineWidth', 4);
plot(p_ESS1, S_ESS1, 'pk', 'MarkerFaceColor', 'k', 'MarkerSize', 20)
text(p_ESS1, S_ESS1,['    ', 'ESS 1'], 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');

%Plot Boundary 2
plot(p_range, boundary2, '-.k', 'LineWidth', 4);
plot(p_ESS2, S_ESS2, 'pk', 'MarkerFaceColor', 'k', 'MarkerSize', 20)
text(p_ESS2, S_ESS2,['    ', 'ESS 2'], 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');

%Plot zero fitness boundary
plot(p_range, zeroFitnessBoundary, 'k', 'LineWidth', 2);

% Add start points with lables.
plot(startingP(1), startingS(1), '^k', 'MarkerFaceColor', 'k', 'MarkerSize', 14);
text(startingP(1), startingS(1),['   ', int2str(1)], 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');
plot(startingP(2), startingS(2), '^k', 'MarkerFaceColor', 'k', 'MarkerSize', 14)
text(startingP(2), startingS(2),['   ', int2str(2)], 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');
plot(startingP(3), startingS(3), '^k', 'MarkerFaceColor', 'k', 'MarkerSize', 14)
text(startingP(3), startingS(3),['   ', int2str(3)], 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');


% Plot trajectory with color gradient to see progression of generations.
if strcmp(ESS, '1') == 1
    x = outputStats.centerX;
    y = outputStats.centerY;
    z = 1:numel(x);
    c = 1:numel(x);      %# colors
    
    surface([x(:), x(:)], [y(:), y(:)], [z(:), z(:)], ...
        [c(:), c(:)], 'EdgeColor','flat', 'FaceColor','none', 'LineWidth', 2);
    colormap( copper(numel(outputStats.centerX)) )
    
elseif strcmp(ESS, '2') == 1
    x = outputStats.centerX;
    y = outputStats.centerY;
    z = zeros(1, numel(x));
    c = 1:numel(x);      %# colors
    
    surface([x(:), x(:)], [y(:), y(:)], [z(:), z(:)], ...
        [c(:), c(:)], 'EdgeColor','flat', 'FaceColor','none', 'LineWidth', 2);
    colormap( copper(numel(outputStats.centerX)) )
    
elseif strcmp(ESS, 'Switch') == 1
    %Need to change linestyle when ESS switches
    xESS1 = outputStats.centerX(1:switchESSTime);
    yESS1 = outputStats.centerY(1:switchESSTime);
    zESS1 = zeros(1, numel(xESS1));
    cESS1 = 1:numel(xESS1);      %# colors
    
    surface([xESS1(:), xESS1(:)], [yESS1(:), yESS1(:)], [zESS1(:), zESS1(:)], ...
        [cESS1(:), cESS1(:)], 'EdgeColor','flat', 'FaceColor','none', 'LineWidth', 2);
    colormap( copper(numel(xESS1)) )
    
    hold on
    
    xESS2 = outputStats.centerX(switchESSTime:end);
    yESS2 = outputStats.centerY(switchESSTime:end);
    zESS2 = zeros(1, numel(xESS2));
    cESS2 = 1:numel(xESS2);        %# colors
    
    surface([xESS2(:), xESS2(:)], [yESS2(:), yESS2(:)], [zESS2(:), zESS2(:)], ...
        [cESS2(:), cESS2(:)], 'EdgeColor','flat', 'FaceColor','none', 'LineWidth', 2);
    colormap( copper(numel(xESS2)) )
    
end


%Format plot.
axis square
xlabel('Fecundity (p)', 'FontSize', 24);
ylabel('Survivorship (S)', 'FontSize', 24);
set(gca, 'FontSize',16);

set(gca,'YTick',[0 [] 0.2 [] 0.4 [] 0.6 [] 0.8 1.0])
set(gca,'XTick',[0 [] 0.2 [] 0.4 [] 0.6 [] 0.8 1.0])

cellArray{1} = 'Trade-Off Boundary 1';
cellArray{2} = 'Trade-Off Boundary 2';
cellArray{3} = 'Constant Population Boundary';
cellArray{4} = 'Initial Phenotypes';

legend(gca, cellArray, 'Location', 'SouthWest')
legend boxoff

box on
axis equal
xlim([0 1])
ylim([0.2 1])