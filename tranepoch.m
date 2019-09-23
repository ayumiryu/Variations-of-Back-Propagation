% *Restore the training, please load "mablab_7.20.mat" first*
% WW1,WW2,bb1,bb2 are for the initial BEST case(20 hidden units)
% WN1,BN1 are for the Nguyen-Widrow initialization
% targets all changed to +0.76/-0.76
% SYNTAX: epochs = tranepoch(W1,W2,b1,b2,alp,PPEKG,TT)
function epochs = tranepoch(W1,W2,b1,b2,alp,PP,TT)
q = zeros(1, 800);%all tuples for doing plotting
pw1 = zeros(1, 800);
pw2 = zeros(1, 800);
pw3 = zeros(1, 800);
pb1 = zeros(1, 800);
pb2 = zeros(1, 800);
for t = 1:500
    [W1out, W2out, b1out, b2out, ave2] = bptans1e(W1,W2,b1,b2,alp,PP,TT);
%     user below to do the Momentum BP
%     [W1out, W2out, b1out, b2out, ave2] = bptans1eM(W1,W2,b1,b2,alp,PP,TT);
    W1 = W1out; W2 = W2out; b1 = b1out;b2 = b2out;
    q(t) = ave2; 
    pw1(t) = W1(3,5); pw2(t) = W1(6,2); 
    pw3(t) = W2(1,5); pb1(t) = b1(12,1); pb2(t) = b2(1,1);
% ------- Stopping criterion---%%%%%----%%%%%-----
%     if ave2 < 0.0045
%         break
%     end
end
% % ====== for counting the hit ratio ======
F=0;
[~,cpats] = size(PP);
TTEKG = hardlims(TT);
a = hardlims(tansig(W2*tansig((W1*PP) + b1) + b2));
    for patnum = 1: cpats
            if a(1,patnum) == TTEKG(1,patnum)
                F = F+1;%save the HIT RATIO
            end
    end

ave2
F
epochs=t;
% figure(1); chkbrd1 (W1);
% figure(2); chkbrd1 (W2);
% figure(3); chkbrd1 (b1);
% figure(4); chkbrd1 (b2);
figure(5); plot(q);
% figure(6); plot(pw1);
% figure(7); plot(pw2);
% figure(8); plot(pw3);
% figure(9); plot(pb1);
% figure(10); plot(pb2);
end

