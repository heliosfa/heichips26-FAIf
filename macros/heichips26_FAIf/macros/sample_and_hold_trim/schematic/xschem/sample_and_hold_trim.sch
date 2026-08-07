v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1350 -370 1420 -370 {lab=SH_OUT}
N 790 -370 790 -190 {lab=SH_OUT}
N 650 -370 790 -370 {lab=SH_OUT}
N 790 -130 790 -90 {lab=VSS}
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
N 930 -130 930 -90 {lab=VSS}
N 790 -90 930 -90 {lab=VSS}
N 930 -200 930 -190 {lab=#net2}
N 930 -370 930 -340 {lab=SH_OUT}
N 790 -370 930 -370 {lab=SH_OUT}
N 1070 -130 1070 -90 {lab=VSS}
N 930 -90 1070 -90 {lab=VSS}
N 1070 -200 1070 -190 {lab=#net3}
N 1070 -370 1070 -340 {lab=SH_OUT}
N 930 -370 1070 -370 {lab=SH_OUT}
N 1210 -130 1210 -90 {lab=VSS}
N 1070 -90 1210 -90 {lab=VSS}
N 1210 -200 1210 -190 {lab=#net4}
N 1210 -370 1210 -340 {lab=SH_OUT}
N 1070 -370 1210 -370 {lab=SH_OUT}
N 1350 -130 1350 -90 {lab=VSS}
N 1210 -90 1350 -90 {lab=VSS}
N 1350 -200 1350 -190 {lab=#net5}
N 1350 -370 1350 -340 {lab=SH_OUT}
N 1210 -370 1350 -370 {lab=SH_OUT}
N 850 -320 1300 -320 {lab=VDD}
N 850 -310 1300 -310 {lab=VSS}
N 1510 -240 1510 -200 {lab=cap_en[3:0]}
C {aswitch.sym} 580 -370 0 0 {name=x1}
C {title.sym} 160 0 0 0 {name=l1 author="Stefan Schippers"}
C {sg13cmos5l_pr/cap_cmomi.sym} 790 -160 0 0 {name=C1
model=cap_cmomi
w=12.5e-6
l=25e-6
mmin=1
mmax=3
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
C {opin.sym} 1420 -370 0 0 {name=p5 lab=SH_OUT}
C {iopin.sym} 340 -90 2 0 {name=p2 lab=VSS}
C {sg13cmos5l_pr/cap_cmomi.sym} 930 -160 0 0 {name=C2
model=cap_cmomi
w=12.5e-6
l=25e-6
mmin=1
mmax=3
feed=double
subblock=0
m=1
mm_ok=1
spiceprefix=X
}
C {sg13cmos5l_pr/cap_cmomi.sym} 1070 -160 0 0 {name=C3
model=cap_cmomi
w=25e-6
l=25e-6
mmin=1
mmax=3
feed=double
subblock=0
m=1
mm_ok=1
spiceprefix=X
}
C {sg13cmos5l_pr/cap_cmomi.sym} 1210 -160 0 0 {name=C4
model=cap_cmomi
w=50e-6
l=25e-6
mmin=1
mmax=3
feed=double
subblock=0
m=1
mm_ok=1
spiceprefix=X
}
C {sg13cmos5l_pr/cap_cmomi.sym} 1350 -160 0 0 {name=C5
model=cap_cmomi
w=50e-6
l=25e-6
mmin=1
mmax=3
feed=double
subblock=0
m=1
mm_ok=1
spiceprefix=X
}
C {/home/benedikt/heichips26-FAIf/macros/heichips26_FAIf/macros/asw_inv/schematic/xschem/asw_inv.sym} 930 -270 1 1 {name=x2}
C {/home/benedikt/heichips26-FAIf/macros/heichips26_FAIf/macros/asw_inv/schematic/xschem/asw_inv.sym} 1070 -270 1 1 {name=x3}
C {/home/benedikt/heichips26-FAIf/macros/heichips26_FAIf/macros/asw_inv/schematic/xschem/asw_inv.sym} 1210 -270 1 1 {name=x4}
C {/home/benedikt/heichips26-FAIf/macros/heichips26_FAIf/macros/asw_inv/schematic/xschem/asw_inv.sym} 1350 -270 1 1 {name=x5}
C {lab_pin.sym} 850 -320 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 850 -310 0 0 {name=p7 sig_type=std_logic lab=VSS}
C {ipin.sym} 1510 -200 3 0 {name=p8 lab=cap_en[3:0]}
