function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% Theta1 has size 25 x 401
% Theta2 has size 10 x 26


% 首先转换y为01
y_e = eye(num_labels);
% 按照y列向量的每一行的值，来复制单位向量的行 1 代表为[1;0;0;0;....] 2 wei [0;1;0;0;0....]
% size y  5000 10
y = y_e(y,:); 


% 添加a_1的bias
% size a_1 5000 401
a_1 = X;
a_1_bias = [ones(m,1) X];

% 线性方程
% z_2 5000 25
z_2 = a_1_bias*Theta1';
a_2 = sigmoid(z_2);

a_2_bias = [ones(m,1) a_2];

z_3 = a_2_bias*Theta2';
a_3 = sigmoid(z_3);
% size(a_3) 5000 10

h = a_3;

% cost function 
J = sum((-y.*log(h) - (1-y).*log(1-h))(:))/m;

% regularization

regularization = lambda*(sum((Theta1(:,2:end).^2)(:))+sum((Theta2(:,2:end).^2)(:)))/2/m;

% cost function
J = J + regularization;

% 现在我们已经完成了前向传播和代价函数
% 下一步我们来计算反向传播，反向传播要用到链式法则里面的multi的exchange规律

% 误差 * 梯度1
delta_3 = a_3 - y;
% size(delta_3) 5000 10

delta_2 = delta_3*Theta2(:,2:end).*sigmoidGradient(z_2);
% size delta_2  5000 25

Delta_1 = zeros(size(Theta1));
Delta_2 = zeros(size(Theta2));

% 链式法则 误差梯度乘以单元值得到theta误差
Delta_1 = Delta_1 + delta_2'*a_1_bias;
Delta_2 = Delta_2 + delta_3'*a_2_bias;

Theta1_grad = Delta_1/m + lambda*Theta1/m;
Theta2_grad = Delta_2/m + lambda*Theta2/m;

Theta1_grad(:,1) = (Delta_1/m)(:,1);
Theta2_grad(:,1) = (Delta_2/m)(:,1);


% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
