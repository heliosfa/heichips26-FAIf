v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 630 -370 1430 -80 {flags=graph
y1=-0.02
y2=3.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=3e-07
x2=3.3e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="in_hv
out_lv"
color="4 1"
dataset=-1
unitx=1
logx=0
logy=0
sim_type=tran}
N 50 -130 50 -110 {lab=0}
N 510 -250 510 -210 {lab=out_lv}
N 480 -250 510 -250 {lab=out_lv}
N 50 -290 280 -290 {lab=#net1}
N 50 -290 50 -190 {lab=#net1}
N 510 -150 510 -110 {lab=0}
N 380 -170 380 -110 {lab=0}
N 140 -130 140 -110 {lab=0}
N 140 -250 140 -190 {lab=in_hv}
N 140 -250 280 -250 {lab=in_hv}
C {vsource.sym} 50 -160 0 0 {name=VVDIG value=1.2 savecurrent=false}
C {code_shown.sym} 55 -665 0 0 {name=NGSPICE only_toplevel=false
value=".options savecurrents
*.include down_digital_translator_tb_tran.save
.control
  save all
  optran 1 1 1 100n 10u 0
  * Static Operation Point Analysis
  op
  write down_digital_translator_tb_tran.raw
  set appendwrite
  * Transient Analysis
  tran 100p 3u
  write down_digital_translator_tb_tran.raw
  exit
.endc
"
}
C {code_shown.sym} 500 -670 0 0 {name=MODEL only_toplevel=true
value=".lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
"}
C {launcher.sym} 590 -510 0 0 {name=h4
descr=SimulateNGSPICE
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults
puts $sim(spice,1,cmd) 

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,1,cmd) \{ngspice  \\"$N\\" -a\}

# change the simulator to be used (Xyce)
set sim(spice,default) 0

# Create FET and BIP .save file
mkdir -p $netlist_dir
write_data [save_params] $netlist_dir/[file rootname [file tail [xschem get current_name]]].save

# run netlist and simulation
xschem netlist
simulate
"}
C {devices/launcher.sym} 590 -462.5 0 0 {name=h2
descr="OP annotate" 
tclcommand="xschem annotate_op"
}
C {launcher.sym} 590 -420 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/down_digital_translator_tb_tran.raw tran"
}
C {gnd.sym} 50 -110 0 0 {name=l1 lab=0}
C {down_digital_translator.sym} 300 -190 0 0 {name=x3}
C {res.sym} 510 -180 0 0 {name=R3
value=10Meg
footprint=1206
device=resistor
m=1}
C {gnd.sym} 510 -110 0 0 {name=l5 lab=0}
C {lab_wire.sym} 510 -250 0 1 {name=p4 sig_type=std_logic lab=out_lv}
C {vsource.sym} 140 -160 0 0 {name=VSIG1 value="3.3 pulse 0 3.3 0 100n 100n 1u 2u" savecurrent=false}
C {gnd.sym} 140 -110 0 0 {name=l6 lab=0}
C {gnd.sym} 380 -110 0 0 {name=l7 lab=0}
C {lab_wire.sym} 140 -250 0 0 {name=p5 sig_type=std_logic lab=in_hv}
C {title.sym} 160 0 0 0 {name=l8 author="Pascal Gesell"}
