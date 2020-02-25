function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% size(X) 50    2

mu = mean(X);
% 3.9893   5.0028

X_norm = bsxfun(@minus, X, mu);

% 得到X的标准差
sigma = std(X_norm);

X_norm = bsxfun(@rdivide, X_norm, sigma);




% ============================================================

end
