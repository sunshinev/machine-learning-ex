function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%



Yellow = find(y==1);
Black = find(y==0);

plot(X(Yellow,1),X(Yellow,2),'+k','LineWidth',2);
plot(X(Black,1),X(Black,2),'oy','MarkerFaceColor','y','MarkerSize',7,'markerEdgeColor','k');
% =========================================================================



hold off;

end
