function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%



% size(X) 12 2
% size(theta) 2 1
% size(y) 12 1


J = sum(((X*theta - y).^2)(:))/(2*m) + lambda*sum((theta(2:end,:).^2)(:))/(2*m);


% grad = ((X*theta- y)*X')./m + lambda*theta/m;
grad = (X'*(X*theta - y))./m;
grad(2:end,:) = grad(2:end,:) + lambda*theta(2:end,:)./m;

% (X*theta - y)*X'



% =========================================================================

grad = grad(:);

end
