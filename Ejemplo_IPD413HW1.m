clear all;
%% Constantes globales
addpath('CurvasInterpolacion_v2');
addpath('CurvasInterpolacion_v2/Data');

Ln = 0.3 %um


%names = {'Id/W';'Vov';'Vth';'Cbd/W';'Cbs/W';'Cgb/W';'Cgs/W';'Cgd/W';'Cgg/W';'Cdb/W';'GmbId';'Ft'};
%gmId_array = linspace(1,25,100);
%L = [0.15, 1.2, 3]; % um
%[X Y] = meshgrid(gmId_array, L);



% Data_n = zeros(3, length(gmId_array), 12);
% Data_n(:,:,1)  = arrayfun(@(x,y) Id_W(x, y, 'n'), X, Y);

% Rango de gm/ID a considerar
gmId_array = linspace(1,20,800);

%% Id_Wn --> generar data para gráfico ID/W versus gm/ID
Id_Wn_data = arrayfun(@(x) Id_W(x, Ln, 'n'), gmId_array);

figure (1)
plot(gmId_array, Id_Wn_data);
title("Id/W vs gm/Id, NMOS");

ylabel("Id/W [A/m]")
xlabel("gm/Id [mS/mA]")

%% Vov
Vov_data = arrayfun(@(x) Vov(x, Ln, 'n'), gmId_array);

figure (2)
plot(gmId_array, Vov_data);
title("Vov vs gm/Id, NMOS");

ylabel("Vov [V]")
xlabel("gm/Id [mS/mA]")