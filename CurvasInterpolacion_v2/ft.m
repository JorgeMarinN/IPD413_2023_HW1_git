% Returns ft(gmId, l, flavor) [Hz] for a given gm/Id [mS/mA] and l [um] values. 
% Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p'). 
function [ft] = ft(x, l, flavor)
ft = x*Id_W(x, l, flavor)/(Cgg_W(x, l, flavor))/2/pi; 
return

