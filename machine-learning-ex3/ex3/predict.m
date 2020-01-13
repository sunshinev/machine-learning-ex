function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% size(X).   5000 * 400
% size(Theta1) 25 * 401
% size(Theta2) 10 * 26

X = [ones(size(X, 1), 1) X];

a0 = sigmoid(X * Theta1');

% size(a0) 5000 % 25

a0 = [ones(size(a0, 1), 1) a0];

% size(a0)e 5000 % 26

a1 = sigmoid(a0 * Theta2');

c = max(a1,[],2);


% 遍历all_theta的样本数据，找到对应c值的每一个index，这个index就是num_labels对应的数字∈(1,10)
% ex3 中y∈(1,10)

for i = 1:size(p,1)
	for j = 1:num_labels
		if c(i) == a1(i, j)
			p(i) = j; % ∈ (1, 10)
		end
	end
end

e

% =========================================================================


end
