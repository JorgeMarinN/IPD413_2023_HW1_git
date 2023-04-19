v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1090 -360 1140 -360 {
lab=g1}
N 1180 -290 1180 -230 {
lab=GND}
N 1180 -360 1260 -360 {
lab=GND}
N 1260 -360 1260 -290 {
lab=GND}
N 1180 -290 1260 -290 {
lab=GND}
N 1180 -530 1180 -400 {
lab=d1}
N 1180 -530 1330 -530 {
lab=d1}
N 1180 -330 1180 -290 {
lab=GND}
N 1180 -400 1180 -390 {
lab=d1}
C {devices/code_shown.sym} 470 -580 0 0 {name=NGSPICE
only_toplevel=true
value="
.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
*.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice ss
*.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice ff
.option wnflag = 1 scale=1e-6

vgs g1 0 dc=0.9
vds d1 0 dc=0.9

.control
save all

save @m.xm1.msky130_fd_pr__nfet_01v8[id]
*save @m.xm1.msky130_fd_pr__nfet_01v8[gm]

dc vgs 0 1.8 0.01
let idn = @m.xm1.msky130_fd_pr__nfet_01v8[id]
*let gmn = @m.xm1.msky130_fd_pr__nfet_01v8[gm]
*let vthn = @m.xm1.msky130_fd_pr__nfet_01v8[vth]
*let vgsn = @m.xm1.msky130_fd_pr__nfet_01v8[vgs]
*let vdsatn = @m.xm1.msky130_fd_pr__nfet_01v8[vdsat]
*let vov = v(g1) - vthn

plot idn
*plot idn vs vov

wrdata /foss/designs/IPD413_2023/HW1/data_nmos_idvgs_VDSp9.dat idn


.endc
" }
C {devices/ipin.sym} 1090 -360 0 0 {name=p1 lab=g1}
C {devices/iopin.sym} 1330 -530 0 0 {name=p2 lab=d1}
C {devices/gnd.sym} 1180 -230 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 1160 -360 0 0 {name=M1
L=0.3
W=10
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
