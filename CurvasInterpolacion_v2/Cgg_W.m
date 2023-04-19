% Returns Cgg_W(gmId, l, flavor) for a given gm/Id [mS/mA] and l [um] values.
% Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p').
function [CggW] = Cgg_W(x, l, flavor)
index = 13;
CggW = functioncore(x, l, flavor, 1, index);
return
