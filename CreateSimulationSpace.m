
%% Calculate (p, S) where fitness = 0
% Solve lambda = 2Sp + 1/2(1-S)p + S(1-p) for lamdba = 0;

p_range = 0:0.01:1;

zeroFitnessBoundary = (2-p_range)./(2+p_range);


%% Calculate two mutation boundaries and ESS's on those boundaries
% Using p^alpha + S^beta = 1

alpha1 = 1;
beta1 = 4;

alpha2 = 3;
beta2 = 6;

%Solve in terms of S.
boundary1 = (1 - p_range.^alpha1).^(1/beta1);
boundary2 = (1 - p_range.^alpha2).^(1/beta2);

%Calculate fitness at each point along this boundary.
lambdaboundary1 = 2.*boundary1.*p_range + 0.5.*(1 - boundary1) .* p_range + boundary1 .* (1 + p_range);
lambdaboundary2 = 2.*boundary1.*p_range + 0.5.*(1 - boundary2) .* p_range + boundary2 .* (1 + p_range);

%Locate index of maximum fitness 
index_lambda1 = find(lambdaboundary1 == max(lambdaboundary1));
index_lambda2 = find(lambdaboundary2 == max(lambdaboundary2));

%Calculate (p, S) coordinate of maximum fitness.
p_ESS1 = p_range(index_lambda1);
S_ESS1 = (1 - p_ESS1.^alpha1).^(1/beta1);

p_ESS2 = p_range(index_lambda2);
S_ESS2 = (1 - p_ESS2.^alpha2).^(1/beta2);

%Calculate fitness values at these ESS's
fitness1 = log(max(lambdaboundary1));
fitness2 = log(max(lambdaboundary2));

