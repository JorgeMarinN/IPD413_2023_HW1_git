% Returns Av(gmId, Vds, l, flavor) for a given gm/Id [mS/mA], VDS [V] and l [um] values.
% Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p').
function [Av] = Av(gmId, Vds, l, flavor)
% First we load the data depending on the flavor.
if strcmp(flavor,'n')
    load('Data/NMOSAvdata.mat');
    load('Data/NMOSAvdata_L.mat');
    load('Data/NMOSAvdata_VDS.mat');
    L = fix(round(L_Avn*10^6*100));
    VDS = VDS_n;
else
    load('Data/PMOSAvdata.mat');
    load('Data/PMOSAvdata_L.mat');
    load('Data/PMOSAvdata_VDS.mat');
    L = fix(round(L_Avp*10^6*100));
    VDS = VDS_p;
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
% We create a matrix with the values of Av (column - gm/Id, row - VDS).
Av_gmIdvds = A(point,:,2);
for j = 3:length(A(1,1,:))
    Av_gmIdvds = [Av_gmIdvds; A(point,:,j)];
end
% Finally we interpolate
Av = interp3D(gmId,Vds,A(point,:,1),VDS, Av_gmIdvds);
%                            |       |
%                            |    VDS axis
%                        gm/Id axis
return

