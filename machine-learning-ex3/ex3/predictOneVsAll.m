function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       


% 这里根据收敛函数给出的theta值，对每个样本分别与十个分类器做计算
a = sigmoid(X * all_theta');

% 获取5000个样本中，每个样本与十个分类器计算结果中的最大值，作为max(hθ(x^i))，视为概率最大
% 意思就是获取logistics function曲线，hθ(x)最大值，说明与训练样本值越接近
c = max(a,[],2);


% 遍历all_theta的样本数据，找到对应c值的每一个index，这个index就是num_labels对应的数字∈(1,10)
% ex3 中y∈(1,10)

for i = 1:size(p,1)
	for j = 1:num_labels
		if c(i) == a(i, j)
			p(i) = j; % ∈ (1, 10)
		end
	end
end


% =========================================================================


end
