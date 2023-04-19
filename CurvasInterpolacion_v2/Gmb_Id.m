% Returns Gmb_Id(gmId, l, flavor) for a given gm/Id [mS/mA] and l [um] values.
% Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p').
function [GmbId] = Gmb_Id(x, l, flavor)
index = 15;
GmbId = functioncore(x, l, flavor, 1, index);
return
