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

% Persistent handles to the files
persistent DAT_NMOS;
persistent DAT_L_NMOS;
persistent DAT_PMOS;
persistent DAT_L_PMOS;
persistent L_n;
persistent L_p;

% Persistent memory blocks for data
persistent L; if isempty(L); L=zeros(1,39); end
persistent A; if isempty(A); A=zeros(39, 181, 15); end

% Load the data only once between multiple function calls
if isempty(DAT_NMOS)
    DAT_NMOS = load('Data/NMOSdata.mat');
    DAT_L_NMOS = load('Data/NMOSdata_L.mat');
    L_n = fix(round(DAT_L_NMOS.L_n*10^6*100));

    DAT_PMOS = load('Data/PMOSdata.mat');
    DAT_L_PMOS = load('Data/PMOSdata_L.mat');
    L_p = fix(round(DAT_L_PMOS.L_p*10^6*100));
end

% Choose the flavor
if strcmp(flavor, 'n')
    A = DAT_NMOS.A;
    L = L_n;
else
    A = DAT_PMOS.A;
    L = L_p;
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
