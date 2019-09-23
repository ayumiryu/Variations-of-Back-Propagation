% bptans1eM.m - performs a Momentum BP for a 2-layer MLP
% SYNTAX: 
% [W1out, W2out, b1out, b2out, ave2] = bptans1eM(W1,W2,b1,b2,alp,PP,TT);
% just change the "bptans1e" function in "tranepoch.m" to this function
function [W1out, W2out, b1out, b2out, ave2] = bptans1eM(W1,W2,b1,b2,alp,PP,TT)
[~, cp] = size(PP);

ave2 = 0;
dw1 = 0;dw2 = 0;db1 = 0;db2 =0; % for saving ¡øW(k-1), ¡øb(k-1)
for q = 1:cp

[W1new, W2new, b1new, b2new, avge2] = bptans1patM(W1,W2,b1,b2,alp,PP(:,q),TT(:,q),dw1,dw2,db1,db2);
ave2 = ave2 + avge2;    % Accumulate the average error squared per pattern
dw1 = W1new - W1;dw2 = W2new - W2;db1 = b1new - b1;db2 =b2new - b2;
%Transfer weights and biases for next pattern:
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
