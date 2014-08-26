
%% Create one new cell with no mutation by copying orignal cell to new cells
% structure.

newCells(size(newCells, 2) + 1).mutations = cells(i).mutations;
newCells(size(newCells, 2)).neutralMutations = cells(i).neutralMutations;
newCells(size(newCells, 2)).S = cells(i).S;
newCells(size(newCells, 2)).p = cells(i).p;
newCells(size(newCells, 2)).plotS = cells(i).plotS;
newCells(size(newCells, 2)).plotp = cells(i).plotp;
newCells(size(newCells, 2)).combination = cells(i).combination;
