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
N 3750 -510 3750 -470 {
lab=GND}
N 3670 -540 3710 -540 {
lab=g2}
N 3750 -620 3750 -570 {
lab=vout}
N 3670 -590 3670 -540 {
lab=g2}
N 3750 -700 3750 -620 {
lab=vout}
N 3750 -820 3750 -760 {
lab=VDD}
N 3750 -660 3820 -660 {
lab=vout}
N 3750 -540 3790 -540 {
lab=GND}
N 3790 -540 3790 -490 {
lab=GND}
N 3750 -490 3790 -490 {
lab=GND}
C {devices/gnd.sym} 3300 -470 0 0 {name=l1 lab=GND}
C {devices/vcvs.sym} 3220 -510 0 0 {name=E1 value=1000}
C {devices/ipin.sym} 3100 -490 0 0 {name=p1 lab=ref}
C {devices/iopin.sym} 3220 -590 0 0 {name=p2 lab=g1}
C {devices/isource.sym} 3300 -730 0 0 {name=I0 value=224u}
C {devices/vdd.sym} 3300 -820 0 0 {name=l2 lab=VDD}
C {devices/iopin.sym} 3370 -660 0 0 {name=p3 lab=d1}
C {devices/code_shown.sym} 3110 -290 0 0 {name=s1 only_toplevel=false value=".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1
vds ref 0 0.9
vsup VDD 0 1.8
vin g1 g2 dc=0 ac=1

cload vout 0 5p

.control
save all

save @m.xm2.msky130_fd_pr__nfet_01v8[gm]
save @m.xm2.msky130_fd_pr__nfet_01v8[id]
save @m.xm2.msky130_fd_pr__nfet_01v8[gds]

dc vin -0.01 0.01 0.001

let gdsn = @m.xm2.msky130_fd_pr__nfet_01v8[gds]
let gmn = @m.xm2.msky130_fd_pr__nfet_01v8[gm]
let idn = @m.xm2.msky130_fd_pr__nfet_01v8[id]
let ao = gmn / gdsn

plot deriv(v(vout)) vs v(vout) ao vs v(vout)

ac dec 100 1 1T
plot vdb(vout)

.endc"}
C {devices/gnd.sym} 3750 -470 0 0 {name=l3 lab=GND}
C {devices/iopin.sym} 3670 -590 0 0 {name=p5 lab=g2}
C {devices/isource.sym} 3750 -730 0 0 {name=I1 value=224u}
C {devices/vdd.sym} 3750 -820 0 0 {name=l4 lab=VDD}
C {devices/iopin.sym} 3820 -660 0 0 {name=p6 lab=vout}
C {sky130_fd_pr/nfet_01v8.sym} 3280 -540 0 0 {name=M1
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
C {sky130_fd_pr/nfet_01v8.sym} 3730 -540 0 0 {name=M2
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
