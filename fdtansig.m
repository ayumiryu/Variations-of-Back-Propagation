% fdtansig - function for implementing BP of sensitivities
% This is mean to implement F dot m (n M) in page 11-26 of book
% It evaluates THE DERIVATIVE of tansig at the previously
% (forward propagation) net input values  in col, vector n
% Returns result already as a diagonal matrix
%
% SYNTAX:  FDMNM = fdtansig(n,a);
%
function FDMNM = fdtansig(n,a);
% da_dn = tansig('dn',n,a)
% FDMNM = diag(da_dn);
FDMNM = diag( tansig('dn',n,a) );
end
