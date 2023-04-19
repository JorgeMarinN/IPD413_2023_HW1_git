%         Function core
%     index        parameter
%       1           gm/Id
%       2           Id/W
%       3           Vov
%       4           Vth
%       5           Cbd/W
%       6           Cbs/W
%       7           Cgsov/W
%       8           Cgdov/W
%       9           Cgbov/W
%       10          Cgb/W
%       11          Cgs/W
%       12          Cgd/W
function [y] = functioncore(x, l, flavor, axis_x, axis_y)
% First we load the data depending on the flavor.
if strcmp(flavor,'n')
    load('Data/NMOSdata.mat');
    load('Data/NMOSdata_L.mat');
    L = fix(round(L_n*10^6*100));
else
    load('Data/PMOSdata.mat');
    load('Data/PMOSdata_L.mat');
    L = fix(round(L_p*10^6*100));
end
% We divide the L vector by l (the input length value), thus the element
% equal to one corresponds to the index that indicates in which submatrix of
% the data loaded before we have to look.
point = 0;
for i=1:length(L)
    if L(i)==fix(round(l*100))
        point = i;
    end
end
% Finally we call the interpotation core.
y = interp(x, A(point,:,axis_x), A(point,:,axis_y));
return
