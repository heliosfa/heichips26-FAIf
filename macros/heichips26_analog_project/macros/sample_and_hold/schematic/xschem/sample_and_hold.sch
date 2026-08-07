v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 790 -370 900 -370 {lab=SH_OUT}
N 790 -370 790 -260 {lab=SH_OUT}
N 650 -370 790 -370 {lab=SH_OUT}
N 790 -200 790 -90 {lab=VSS}
N 630 -90 790 -90 {lab=VSS}
N 630 -320 630 -90 {lab=VSS}
N 440 -90 630 -90 {lab=VSS}
N 430 -490 630 -490 {lab=VDD}
N 630 -490 630 -420 {lab=VDD}
N 430 -230 430 -210 {lab=#net1}
N 430 -210 580 -210 {lab=#net1}
N 580 -320 580 -210 {lab=#net1}
N 430 -210 430 -190 {lab=#net1}
N 580 -450 580 -420 {lab=SH_EN}
N 370 -450 580 -450 {lab=SH_EN}
N 370 -260 370 -160 {lab=SH_EN}
N 370 -160 390 -160 {lab=SH_EN}
N 370 -260 390 -260 {lab=SH_EN}
N 370 -450 370 -260 {lab=SH_EN}
N 340 -260 370 -260 {lab=SH_EN}
N 340 -370 510 -370 {lab=SH_IN}
N 430 -310 430 -290 {lab=VDD}
N 340 -490 430 -490 {lab=VDD}
N 430 -260 440 -260 {lab=VDD}
N 440 -310 440 -260 {lab=VDD}
N 430 -310 440 -310 {lab=VDD}
N 430 -490 430 -310 {lab=VDD}
N 430 -160 440 -160 {lab=VSS}
N 440 -160 440 -90 {lab=VSS}
N 430 -90 440 -90 {lab=VSS}
N 430 -130 430 -90 {lab=VSS}
N 340 -90 430 -90 {lab=VSS}
C {aswitch.sym} 580 -370 0 0 {name=x1}
C {title.sym} 160 0 0 0 {name=l1 author="Stefan Schippers"}
C {sg13cmos5l_pr/cap_cmomi.sym} 790 -230 0 0 {name=C1
model=cap_cmomi
w=5e-6
l=5e-6
mmin=1
mmax=4
feed=double
subblock=0
m=1
mm_ok=1
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 410 -260 0 0 {name=MP1
l=0.45u
w=0.6u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 410 -160 0 0 {name=MN1
l=0.45u
w=0.3u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {ipin.sym} 340 -370 0 0 {name=p1 lab=SH_IN}
C {ipin.sym} 340 -260 0 0 {name=p3 lab=SH_EN}
C {iopin.sym} 340 -490 2 0 {name=p4 lab=VDD}
C {opin.sym} 900 -370 0 0 {name=p5 lab=SH_OUT}
C {iopin.sym} 340 -90 2 0 {name=p2 lab=VSS}
