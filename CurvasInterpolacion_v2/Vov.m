% Returns Vov(gmId, l, flavor) for a given gm/Id [mS/mA] and l [um] values. 
% Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p'). 
function [Vov] = Vov(x, l, flavor)
index = 3;
Vov = functioncore(x, l, flavor, 1, index);
return

