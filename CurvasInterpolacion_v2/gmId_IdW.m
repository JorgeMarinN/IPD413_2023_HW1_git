% Returns gmId_IdW(IdW, l, flavor) for a given Id/W [mS/mA] and l [um] values. 
% Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p'). 
function [gmId] = gmId_IdW(x, l, flavor)
index = 2;
gmId = functioncore(x, l, flavor, index, 1);
return

