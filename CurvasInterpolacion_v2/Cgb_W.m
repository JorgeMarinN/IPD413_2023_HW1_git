% Returns Cgb_W(gmId, l, flavor) for a given gm/Id [mS/mA] and l [um] values. 
% Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p'). 
function [CgbW] = Cgb_W(x, l, flavor)
index = 10;
CgbW = functioncore(x, l, flavor, 1, index);
return

