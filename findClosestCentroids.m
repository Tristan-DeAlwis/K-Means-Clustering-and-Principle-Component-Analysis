function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])

% Set K and idx
K = size(centroids, 1);
idx = zeros(size(X,1), 1);

distance = [length(X), K];
J = [];

for i = 1:K
   distance = bsxfun(@minus, X, centroids(i,:));
   distance = sum(distance.^2,2);
   J = [J distance];
end

[v, idx] = min(J');
idx = idx';

end

