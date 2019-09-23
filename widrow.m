% p=20, n=47, 
% for restoring, just use WN1,BN1 to run the function
% >>> epochs = tranepoch(WN1,WW2,BN1,bb2,alp,PPEKG,TT)
% ===================
% SYNTAX for Nyugen-Widrow initialization: [B, WN1,BN1] = widrow(p, n, WW1)
function [B, WN1,BN1] = widrow(p, n, WW1)

B = 0.7*(p^(1/n));
[rows,cpats] = size(WW1);
WN1 = zeros(rows, cpats);
for r = 1:rows
    for c = 1:cpats
        WN1(r,c) = B * WW1(r,c)/norm(WW1(r,:));
    end
end

BN1 = B * randn(20,1) * 0.3;

end
