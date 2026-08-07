v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1660 -720 2460 -320 {flags=graph
y1=-8.1e-14
y2=3e-12
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=3.3
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="i(vlgnd)
i(vlhigh)"
color="4 8"
dataset=-1
unitx=1
logx=0
logy=0
linewidth_mult=3
autoload=0}
B 2 1660 -1160 2460 -760 {flags=graph
y1=284.62863
y2=1052.6286
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=3.3
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
linewidth_mult=3
color="4 8"
node="i(VDD)
-1m i(v1) /"
sim_type=dc
autoload=0
hcursor1_y=995.04731}
T {Testbench for Output Voltage Swing analysis - Inverter} 520 -1730 0 0 1 1 {}
N 1320 -1100 1320 -1060 {lab=VDD}
N 1320 -1000 1320 -960 {lab=GND}
N 960 -860 960 -840 {lab=vin}
N 900 -860 960 -860 {lab=vin}
N 990 -860 1020 -860 {lab=vin}
N 1320 -860 1400 -860 {lab=vout}
N 960 -780 960 -760 {lab=GND}
N 1210 -860 1320 -860 {lab=vout}
N 1320 -860 1320 -840 {lab=vout}
N 1320 -780 1320 -760 {lab=GND}
N 1140 -940 1140 -910 {lab=VDD}
N 1140 -780 1140 -750 {lab=GND}
N 1090 -810 1090 -780 {lab=GND}
N 1090 -780 1140 -780 {lab=GND}
N 1140 -810 1140 -780 {lab=GND}
N 1090 -940 1090 -910 {lab=VDD}
N 1090 -940 1140 -940 {lab=VDD}
N 1140 -970 1140 -940 {lab=VDD}
N 1210 -1030 1210 -990 {lab=vin}
N 990 -1030 1210 -1030 {lab=vin}
N 990 -1030 990 -860 {lab=vin}
N 960 -860 990 -860 {lab=vin}
N 1210 -930 1210 -860 {lab=vout}
N 1160 -860 1210 -860 {lab=vout}
N 1140 -440 1140 -410 {lab=GND}
N 1140 -600 1140 -570 {lab=VDD}
N 1160 -520 1210 -520 {lab=GND}
N 1050 -240 1050 -210 {lab=GND}
N 1050 -400 1050 -370 {lab=VDD}
N 1070 -320 1120 -320 {lab=VDD}
N 1020 -400 1050 -400 {lab=VDD}
N 1020 -400 1020 -270 {lab=VDD}
N 1050 -430 1050 -400 {lab=VDD}
N 1000 -270 1020 -270 {lab=VDD}
N 1030 -240 1050 -240 {lab=GND}
N 1050 -270 1050 -240 {lab=GND}
N 1030 -370 1030 -240 {lab=GND}
N 1000 -370 1030 -370 {lab=GND}
N 1110 -600 1110 -470 {lab=VDD}
N 1090 -470 1110 -470 {lab=VDD}
N 1120 -570 1120 -440 {lab=GND}
N 1090 -570 1120 -570 {lab=GND}
N 1110 -600 1140 -600 {lab=VDD}
N 1140 -630 1140 -600 {lab=VDD}
N 1120 -440 1140 -440 {lab=GND}
N 1140 -470 1140 -440 {lab=GND}
N 900 -520 930 -520 {lab=vin}
N 990 -520 1020 -520 {lab=#net1}
N 810 -320 840 -320 {lab=vin}
N 900 -320 930 -320 {lab=#net2}
C {devices/code_shown.sym} 60 -1250 0 0 {name=NGSPICE
only_toplevel=true 
value="
* .include ../../../netlist/pex/inverter_magic_pex_3.spice
.param VDD=3.3
.csparam VDD=VDD
.param Vcm=VDD/2
.csparam Vcm=Vcm
.param temp=27
.param Cload=10p
.param Rload=1k
.options savecurrents klu method=gear reltol=1e-3 abstol=1e-15 gmin=1e-15
.control

save all

* Operating Point Analysis
op
remzerovec
write @schname\\\\.raw
set appendwrite

* DC Sweep
dc Vgsp 0 $&VDD 1m
remzerovec
write @schname\\\\.raw
set appendwrite

* Plotting
plot vin vout
plot i(v1)

* Measurement
meas dc Vgsp_at_Vcm when vout=Vcm
print Vgsp_at_Vcm

* Write Data
unset appendwrite
set wr_vecnames
set wr_singlescale
wrdata ../plot_simulations/data/@schname\\\\.txt v(vin) v(vout)

*quit
.endc
"}
C {devices/launcher.sym} 1720 -1340 0 0 {name=h2
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {title-3.sym} 0 0 0 0 {name=l2 author="Simon Dorrer" rev=1.0 lock=true}
C {devices/launcher.sym} 1720 -1220 0 0 {name=h1
descr="Load waves" 
tclcommand="xschem raw_read $netlist_dir/[file rootname [file tail [xschem get current_name]]].raw dc"
}
C {devices/launcher.sym} 1720 -1280 0 0 {name=h3
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code_shown.sym} 1960 -1330 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
"}
C {devices/vsource.sym} 1320 -1030 0 0 {name=VDD value=\{VDD\}}
C {devices/gnd.sym} 1320 -960 0 0 {name=l3 lab=GND}
C {vdd.sym} 1320 -1100 0 0 {name=l7 lab=VDD}
C {devices/lab_pin.sym} 1400 -860 0 1 {name=l12 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 900 -860 0 0 {name=l22 sig_type=std_logic lab=vin}
C {devices/gnd.sym} 960 -760 0 0 {name=l26 lab=GND}
C {devices/gnd.sym} 1140 -750 0 0 {name=l1 lab=GND}
C {res.sym} 1320 -810 0 0 {name=R1
value=\{Rload\}
footprint=1206
device=resistor
m=1
spice_ignore=true}
C {vdd.sym} 1140 -970 0 0 {name=l4 lab=VDD}
C {devices/gnd.sym} 1320 -760 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 960 -810 0 0 {name=Vgsp value=0
}
C {inverter.sym} 1080 -1280 0 0 {name=x2
spice_ignore=true}
C {inverter_pex.sym} 1320 -1280 0 0 {name=x3
spice_ignore=true}
C {aswitch.sym} 1090 -860 0 0 {name=x4}
C {vsource.sym} 1210 -960 0 0 {name=V1 value=1m savecurrent=true}
C {devices/lab_pin.sym} 900 -520 0 0 {name=l5 sig_type=std_logic lab=vin}
C {devices/gnd.sym} 1140 -410 0 0 {name=l8 lab=GND}
C {vdd.sym} 1140 -630 0 0 {name=l9 lab=VDD}
C {aswitch.sym} 1090 -520 0 0 {name=x1}
C {devices/gnd.sym} 1050 -210 0 0 {name=l11 lab=GND}
C {vdd.sym} 1050 -430 0 0 {name=l13 lab=VDD}
C {aswitch.sym} 1000 -320 0 0 {name=x5}
C {devices/gnd.sym} 1210 -520 0 0 {name=l14 lab=GND}
C {vdd.sym} 1120 -320 0 0 {name=l15 lab=VDD}
C {devices/vsource.sym} 960 -520 1 0 {name=Vlgnd value=0
}
C {devices/lab_pin.sym} 810 -320 0 0 {name=l10 sig_type=std_logic lab=vin}
C {devices/vsource.sym} 870 -320 1 0 {name=Vlhigh value=0
}
