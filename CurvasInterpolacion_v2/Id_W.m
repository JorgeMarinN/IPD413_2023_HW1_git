% Returns Id_W(gmId, l, flavor) for a given gm/Id [mS/mA] and l [um] values. 
% Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p'). 
function [IdW] = Id_W(x, l, flavor)
index = 2;
IdW = functioncore(x, l, flavor, 1, index);
return

