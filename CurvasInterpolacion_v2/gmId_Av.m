% Returns gmId_Av(Av, Vds, l, flavor) for a given Av [mS/mA], Vds [V] and l 
% [um] values. Flavor indicates if the transistor used is NMOS ('n') or PMOS ('p'). 
function [gmId] = gmId_Av(av, Vds, l, flavor)
% Esta función no s epuede hacer así no más, porque no es uno a uno.
gmidaux = 0.1:0.5:26;
Avaux = zeros(1,length(gmidaux));
for i=1:length(gmidaux)
    Avaux(i) = Av(gmidaux(i), Vds, l, flavor);
end
min = 1e30;
id = 1;
for j=1:length(Avaux)
    res = abs(av-Avaux(j));
    if res<min
        min = res;
        id = j;
    end
end
gmId = gmidaux(id);
return

 

