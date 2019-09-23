% bptans1e - performs a full epoch of training for a 2-layer MLP
% Using basic Backpropagation
% IT ASSUMES TAN-SIGMOID activation function in all elements of the ntwk.
% Receives initial weights and biases, as well as the alpha value
% Receives all the training patterns in matrix PP and all targets in TT
% Each column of PP is a training pattern
% Each column of TT is a target vector
% Returns final weights and biases and average squared error for the epoch
%
% SYNTAX: 
% [W1out, W2out, b1out, b2out, ave2] = bptans1e(W1,W2,b1,b2,alp,PP,TT);
%
function [W1out, W2out, b1out, b2out, ave2] = bptans1e(W1,W2,b1,b2,alp,PP,TT);

[rp, cp] = size(PP);

ave2 = 0;

for q = 1:cp;

[W1new, W2new, b1new, b2new, avge2] = bptans1pat(W1,W2,b1,b2,alp,PP(:,q),TT(:,q));
ave2 = ave2 + avge2;    % Accumulate the average error squared per pattern

%Transfer weights and biases fornext pattern:
W1 = W1new;
W2 = W2new;
b1 = b1new;
b2 = b2new;

end

ave2 = ave2 / cp;

W1out = W1new;
W2out = W2new;
b1out = b1new;
b2out = b2new;

end


