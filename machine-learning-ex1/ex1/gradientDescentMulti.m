function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);



for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

    % tmp_theta = zeros(size(theta),1);

    % for i=1:length(theta)
    %     if(i == 1)
    %         tmp_theta(1) =  theta(1) - alpha*(1/m)*ones(1,length(X))*((X*theta-y)(:));
    %     else
    %         tmp_theta(i) = theta(i) - alpha*(1/m)*sum((X(:,i)'*(X*theta-y))(:));
    %     end
    % end

    theta = theta - alpha*(1/m)*(X'*(X*theta-y));

    % theta = tmp_theta;
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
