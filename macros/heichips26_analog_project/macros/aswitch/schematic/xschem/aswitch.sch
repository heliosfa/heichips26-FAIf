v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Inverter with Dummies and with LV Transistors} 610 -1700 0 0 1 1 {}
N 1240 -760 1240 -700 {lab=sw}
N 1040 -940 1040 -870 {lab=a}
N 1000 -870 1040 -870 {lab=a}
N 1450 -940 1450 -870 {lab=b}
N 1450 -870 1490 -870 {lab=b}
N 1040 -870 1040 -800 {lab=a}
N 1450 -870 1450 -800 {lab=b}
N 1240 -1050 1240 -980 {lab=sw_b}
N 1240 -940 1240 -920 {lab=VDD}
N 1240 -920 1350 -920 {lab=VDD}
N 1040 -940 1100 -940 {lab=a}
N 1100 -940 1100 -930 {lab=a}
N 1100 -930 1160 -930 {lab=a}
N 1160 -940 1160 -930 {lab=a}
N 1160 -940 1210 -940 {lab=a}
N 1270 -940 1320 -940 {lab=b}
N 1320 -940 1320 -930 {lab=b}
N 1320 -930 1380 -930 {lab=b}
N 1380 -940 1380 -930 {lab=b}
N 1380 -940 1450 -940 {lab=b}
N 1040 -800 1100 -800 {lab=a}
N 1100 -810 1100 -800 {lab=a}
N 1100 -810 1160 -810 {lab=a}
N 1160 -810 1160 -800 {lab=a}
N 1160 -800 1210 -800 {lab=a}
N 1270 -800 1320 -800 {lab=b}
N 1320 -810 1320 -800 {lab=b}
N 1320 -810 1380 -810 {lab=b}
N 1380 -810 1380 -800 {lab=b}
N 1380 -800 1450 -800 {lab=b}
N 1350 -820 1390 -820 {lab=VSS}
N 1240 -820 1240 -800 {lab=VSS}
N 1130 -940 1130 -920 {lab=VDD}
N 1130 -920 1240 -920 {lab=VDD}
N 1350 -940 1350 -920 {lab=VDD}
N 1350 -920 1380 -920 {lab=VDD}
N 1130 -820 1130 -800 {lab=VSS}
N 1130 -820 1240 -820 {lab=VSS}
N 1350 -820 1350 -800 {lab=VSS}
N 1240 -820 1350 -820 {lab=VSS}
N 1130 -1010 1130 -980 {lab=sw}
N 1350 -1010 1350 -980 {lab=sw}
N 1130 -1010 1350 -1010 {lab=sw}
N 1130 -1030 1130 -1010 {lab=sw}
N 1350 -730 1350 -710 {lab=sw_b}
N 1130 -760 1130 -730 {lab=sw_b}
N 1130 -730 1350 -730 {lab=sw_b}
N 1350 -760 1350 -730 {lab=sw_b}
C {title-3.sym} 0 0 0 0 {name=l1 author="Simon Dorrer" rev=1.0 lock=true}
C {devices/iopin.sym} 1000 -870 2 0 {name=p10 lab=a
}
C {devices/iopin.sym} 1240 -1050 3 0 {name=p11 lab=sw_b}
C {devices/iopin.sym} 1490 -870 0 0 {name=p6 lab=b}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1240 -780 3 0 {name=M1
l=0.6u
w=4u
 ng=2
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1240 -960 1 0 {name=M2
l=0.6u
w=14u
 ng=2
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {iopin.sym} 1240 -700 1 0 {name=p1 lab=sw}
C {iopin.sym} 1380 -920 0 0 {name=p2 lab=VDD}
C {iopin.sym} 1390 -820 0 0 {name=p3 lab=VSS}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1130 -780 3 0 {name=M1Dummyb
l=0.6u
w=2u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 1350 -780 3 0 {name=M3
l=0.6u
w=2u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1130 -960 1 0 {name=M4
l=0.6u
w=7u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1350 -960 1 0 {name=M5
l=0.6u
w=7u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 1130 -1030 1 0 {name=p4 sig_type=std_logic lab=sw}
C {lab_pin.sym} 1350 -710 3 0 {name=p5 sig_type=std_logic lab=sw_b}
