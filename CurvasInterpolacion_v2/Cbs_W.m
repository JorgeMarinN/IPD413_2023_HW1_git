% Returns Cbs_W(gmId, l, flavor) for a given gm/Id [mS/mA] and l [um] values.
% Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p').
function [CbsW] = Cbs_W(x, l, flavor)
index = 6;
CbsW = functioncore(x, l, flavor, 1, index);
return

