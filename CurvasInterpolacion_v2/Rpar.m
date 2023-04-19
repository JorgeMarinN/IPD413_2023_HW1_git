% Rtot = Rpar([R1 R2... RN]) calculates the parallel between N resistors.
function [Rtot] = Rpar(R)
Rtot = 1/sum(1./R);
return

