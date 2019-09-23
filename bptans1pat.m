% bptans1pat.m - Function to train a 2 layer MLP with basic BP
% IT ASSUMES THE USE OF (bipolar) tansig activation function in all neurons
% It receives TWO WEIGHT MATRICES (old weights) W1, W2
% and TWO BIAS VECTORS (old biases) b1, b2
% IT ALSO RECEIVES THE INPUT PATTERN, p (column vector) and
% The column vector of targets, t, and the adaptation rate alpha (alp)
% It returns TWO NEW WEIGHT MATRICES W1new, W2new,
% and TWO NEW BIAS VECTORS b1new, b2new,
% AND an average square error avge2 for the current pattern
%
% SYNTAX: [W1new, W2new, b1new, b2new, avge2] = bptans1pat(W1,W2,b1,b2,alp,p,t);
% 
function [W1new, W2new, b1new, b2new, avge2] = bptans1pat(W1,W2,b1,b2,alp,p,t);
r = 0.98;
% PHASE I - Forward propagation, and calculation of avge2

% From input pattern to activation of first layer, a1
n1 = W1 * p + b1;
a1 = tansig(n1);

% From a1 to activation of layer 2 (which is the output)
n2 = W2 * a1 + b2;
a2 = tansig(n2);
 
numouts = length(t);
avge2 = ( (t - a2)' * (t-a2) ) / numouts;

% PHASE II - Backpropagation of sensitivities
% s2 is found directly using the error (t - a2)

s2 = (-2) *  ( (fdtansig(n2,a2) )  *  (t - a2) );

% Then s1 will be BACK PROPAGATED from s2:
s1 = ( fdtansig(n1,a1) )  * W2' *  s2;

%PHASE III - UPDATE AL THE WEIGHTS AND BIASES
% Update the weights for layer 2
W2new = W2  - alp * (s2 *a1');
b2new = b2 - alp * s2;
% Update the weights for layer 1
W1new = W1  - alp * (s1 *p');
b1new = b1 - alp * s1;


end
