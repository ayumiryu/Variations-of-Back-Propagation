% bptans1patM.m - Function to train a 2 layer MLP with Momentum BP
% SYNTAX: [W1new, W2new, b1new, b2new, avge2] = bptans1patM(W1,W2,b1,b2,alp,p,t,dw1,dw2,db1,db2);
function [W1new, W2new, b1new, b2new, avge2] = bptans1patM(W1,W2,b1,b2,alp,p,t,dw1,dw2,db1,db2)
r = 0.96;
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

W2new = W2 + r * dw2  - (1-r)*alp * (s2 *a1');
b2new = b2 + r * db2 - (1-r)*alp * s2;
W1new = W1 + r * dw1 - (1-r)*alp * (s1 *p');
b1new = b1 + r * db1 - (1-r)*alp * s1;

end
