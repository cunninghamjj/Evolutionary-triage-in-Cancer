function [mappedP_unbounded, mappedS_unbounded, mappedP_ESS1, mappedS_ESS1, mappedP_ESS2, mappedS_ESS2, mappedP_bounded, mappedS_bounded] = mapGenomes(startingP, startingS, totalDeltaP, totalDeltaS, alpha1, alpha2, beta1, beta2 )

%% Map all genomes from starting point
mappedP_unbounded = startingP + totalDeltaP;
mappedS_unbounded = startingS + totalDeltaS;

mappedP_bounded = mappedP_unbounded;
mappedS_bounded = mappedS_unbounded;

%% Bound genomes to simulation space. 
outOfLowerBoundsIndecesP = find(mappedP_unbounded < 0); 
outOfLowerBoundsIndecesS = find(mappedS_unbounded < 0); 
outOfUpperBoundsIndecesP = find(mappedP_unbounded > 1); 
outOfUpperBoundsIndecesS = find(mappedS_unbounded > 1); 

mappedP_bounded(outOfLowerBoundsIndecesP) = 0;
mappedP_bounded(outOfUpperBoundsIndecesP) = 0;
mappedP_bounded(outOfLowerBoundsIndecesS) = 0;
mappedP_bounded(outOfUpperBoundsIndecesS) = 0;

mappedS_bounded(outOfLowerBoundsIndecesS) = 0;
mappedS_bounded(outOfUpperBoundsIndecesS) = 0;
mappedS_bounded(outOfLowerBoundsIndecesP) = 0;
mappedS_bounded(outOfUpperBoundsIndecesP) = 0;


%% Find all genomes that are outside of the mutation boundary and
% reflect them inside. 

% For boundary 1
for i = 1:1:length(mappedP_bounded)
    
    p = mappedP_bounded(i);
    S = mappedS_bounded(i);
    
    %Determine if this (p, S) is outside the boundary
    if ((p^alpha1 + S^beta1) > 1)
        
        %Calculate minimum distance projection point onto boundary
        p_range = 0:0.01:1;
        distancesToFitnessFrontier = sqrt( (p_range - p).^2 + ( (1 - p_range.^alpha1).^(1/beta1) - S ).^2 );
        index = find(distancesToFitnessFrontier == min(distancesToFitnessFrontier));
        p_min = p_range(index);
        S_min = (1 - p_min.^alpha1).^(1/beta1);

        %Reflect (p, S) across boundary
        mappedP_ESS1(i) = p_min - (p - p_min);
        mappedS_ESS1(i) = S_min - (S - S_min);
        
    else
        
        %If (p, S) is not outside the boundary, leave it unchanged.
        mappedP_ESS1(i) = p;
        mappedS_ESS1(i) = S;
        
    end
    
end

% For boundary 2
for i = 1:1:length(mappedP_bounded)
    
    p = mappedP_bounded(i);
    S = mappedS_bounded(i);
    
    %Determine if this (p, S) is outside the boundary
    if ((p^alpha2 + S^beta2) > 1)
        
        %Calculate minimum distance projection point onto boundary
        p_range = 0:0.01:1;
        distancesToFitnessFrontier = sqrt( (p_range - p).^2 + ( (1 - p_range.^alpha2).^(1/beta2) - S ).^2 );
        index = find(distancesToFitnessFrontier == min(distancesToFitnessFrontier));
        p_min = p_range(index);
        S_min = (1 - p_min.^alpha2).^(1/beta2);

        %Reflect (p, S) across boundary
        mappedP_ESS2(i) = p_min - (p - p_min);
        mappedS_ESS2(i) = S_min - (S - S_min);
        
    else
        
        %If (p, S) is not outside the boundary, leave it unchanged.
        mappedP_ESS2(i) = p;
        mappedS_ESS2(i) = S;
        
    end
    
end








