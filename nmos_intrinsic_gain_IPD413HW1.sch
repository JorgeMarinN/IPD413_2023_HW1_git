v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 3300 -510 3300 -470 {
lab=GND}
N 3220 -540 3260 -540 {
lab=g1}
N 3220 -480 3300 -480 {
lab=GND}
N 3100 -490 3180 -490 {
lab=ref}
N 3120 -530 3180 -530 {
lab=d1}
N 3120 -620 3120 -530 {
lab=d1}
N 3300 -620 3300 -570 {
lab=d1}
N 3120 -620 3300 -620 {
lab=d1}
N 3220 -590 3220 -540 {
lab=g1}
N 3300 -700 3300 -620 {
lab=d1}
N 3300 -820 3300 -760 {
lab=VDD}
N 3300 -660 3370 -660 {
lab=d1}
N 3300 -540 3340 -540 {
lab=GND}
N 3340 -540 3340 -490 {
lab=GND}
N 3300 -490 3340 -490 {
lab=GND}
C {devices/gnd.sym} 3300 -470 0 0 {name=l1 lab=GND}
C {devices/vcvs.sym} 3220 -510 0 0 {name=E1 value=1000}
C {devices/ipin.sym} 3100 -490 0 0 {name=p1 lab=ref}
C {devices/iopin.sym} 3220 -590 0 0 {name=p2 lab=g1}
C {devices/isource.sym} 3300 -730 0 0 {name=I0 value=1m}
C {devices/vdd.sym} 3300 -820 0 0 {name=l2 lab=VDD}
C {devices/iopin.sym} 3370 -660 0 0 {name=p3 lab=d1}
C {devices/code_shown.sym} 3480 -770 0 0 {name=s1 only_toplevel=false value=".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1
vds ref 0 0.9
vsup VDD 0 1.8

.control
save all

dc vds 0.2 1.8 0.01
plot abs(1/deriv(v(g1)))
wrdata /foss/designs/IPD413_2023_HW1_git/data_nmos_intrinsic_gain_Lp15.dat abs(1/deriv(v(g1)))

.endc"}
C {sky130_fd_pr/nfet_01v8.sym} 3280 -540 0 0 {name=M1
L=0.15
W=40
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
