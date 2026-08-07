v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 830 -610 1630 -210 {flags=graph
y1=-0.0019
y2=3.4
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=2e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
legendmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
sim_type=tran
color="7 4 8 6"
node="cout
cinp
cinn
x2.cout_stage"
autoload=1
hilight_wave=-1}
B 2 830 -1010 1630 -610 {flags=graph
y1=0
y2=3.3
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
legendmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
sim_type=dc
color="7 4 8"
node="cout
cinp
cinn"
autoload=1
hilight_wave=2}
N 320 -400 560 -400 {lab=CINN}
N 320 -400 320 -310 {lab=CINN}
N 420 -360 560 -360 {lab=CINP}
N 420 -360 420 -310 {lab=CINP}
N 620 -310 620 -210 {lab=0}
N 420 -210 620 -210 {lab=0}
N 420 -250 420 -210 {lab=0}
N 320 -210 420 -210 {lab=0}
N 320 -250 320 -210 {lab=0}
N 620 -510 620 -450 {lab=VCCA}
N 210 -510 620 -510 {lab=VCCA}
N 80 -510 80 -400 {lab=VCCA}
N 80 -340 80 -210 {lab=0}
N 210 -210 320 -210 {lab=0}
N 600 -490 600 -460 {lab=PBIAS}
N 730 -380 800 -380 {lab=COUT}
N 210 -390 210 -350 {lab=PBIAS}
N 210 -290 210 -210 {lab=0}
N 80 -210 210 -210 {lab=0}
N 210 -390 270 -390 {lab=PBIAS}
N 210 -410 210 -390 {lab=PBIAS}
N 270 -440 270 -390 {lab=PBIAS}
N 270 -490 600 -490 {lab=PBIAS}
N 250 -440 270 -440 {lab=PBIAS}
N 270 -490 270 -440 {lab=PBIAS}
N 210 -510 210 -470 {lab=VCCA}
N 200 -510 210 -510 {lab=VCCA}
N 200 -440 210 -440 {lab=VCCA}
N 200 -510 200 -440 {lab=VCCA}
N 80 -510 200 -510 {lab=VCCA}
N 80 -210 80 -190 {lab=0}
C {555_comparator.sym} 580 -380 0 0 {name=x2}
C {simulator_commands_shown.sym} 100 -940 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
"
      }
C {simulator_commands_shown.sym} 390 -940 0 0 {name="SimulatorNGSPICE"
simulator=ngspice
only_toplevel=false 
value="
*.include tb_555_comparator.save
.param temp=27
.control
  set num_threads=6
  save all
  op
  write 555_comparator_tb_tran.raw
  set appendwrite
  tran 10n 20u
  write 555_comparator_tb_tran.raw
  dc VcompP 0 3.3 0.01
  write 555_comparator_tb_tran.raw
  exit
.endc
"}
C {launcher.sym} 170 -820 0 0 {name=h4
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
file mkdir $netlist_dir
write_data [save_params] $netlist_dir/[file rootname [file tail [xschem get current_name]]].save

# run netlist and simulation
xschem netlist
simulate
"}
C {devices/launcher.sym} 170 -720 0 0 {name=h2
descr="OP annotate" 
tclcommand="xschem annotate_op"
}
C {launcher.sym} 170 -770 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/555_comparator_tb_tran.raw tran"
}
C {vsource.sym} 80 -370 0 0 {name=V1 value=3.3 savecurrent=false}
C {vsource.sym} 320 -280 0 0 {name=VcompN value=1.65 savecurrent=false}
C {vsource.sym} 420 -280 0 0 {name=VcompP value="1.0 pulse 0 3.3 0 10u 10u 0 400u" savecurrent=false}
C {lab_wire.sym} 120 -510 0 0 {name=p1 sig_type=std_logic lab=VCCA}
C {lab_wire.sym} 510 -400 0 0 {name=p3 sig_type=std_logic lab=CINN}
C {lab_wire.sym} 510 -360 0 0 {name=p4 sig_type=std_logic lab=CINP}
C {lab_wire.sym} 770 -380 0 1 {name=p5 sig_type=std_logic lab=COUT}
C {isource.sym} 210 -320 0 0 {name=I0 value=100n}
C {sg13g2_pr/sg13_hv_pmos.sym} 230 -440 0 1 {name=M1
l=1u
w=0.8u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_wire.sym} 310 -490 2 0 {name=p2 sig_type=std_logic lab=PBIAS}
C {gnd.sym} 80 -190 0 0 {name=l1 lab=0}
