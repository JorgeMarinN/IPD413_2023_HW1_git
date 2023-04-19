% Returns Vth(gmId, l, flavor) for a given gm/Id [mS/mA] and l [um] values. 
% Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p'). 
function [Vth] = Vth(x, l, flavor)
index = 4;
Vth = functioncore(x, l, flavor, 1, index);
return

