% Returns ro(gmId, Id, Vds, l, flavor) for a given gm/Id [mS/mA], Id [A], VDS [V] and l [um] values. 
% Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p').
function [ro] = ro(gmId, Id, Vds, l, flavor)
av = Av(gmId, Vds, l, flavor);
ro = av/gmId/Id;
return