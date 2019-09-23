%chkbrd1:  Displays a checkerboard pattern from a numerical matrix
% SYNTAX:  function ckb =  chkbrd1(mtx);
%
function ckb =  chkbrd1(mtx);
mtx = flipud(mtx);
[r,c] = size(mtx);
ckb = zeros(r+1,c+1);
ckb(1:r,1:c) = mtx;
pcolor(ckb);
shading faceted;
colormap('cool')
% colormap('gray')
colorbar

end

