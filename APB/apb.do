vlib work 
vdel -all
vlib work 


vlog apb_master.sv
vlog apb_slave.sv
vlog apb_top.sv
vlog apb_tb.sv

vsim work.tb
do apb_wave.do
#add wave sim:/tb/DEVARA/DEVARA/mem
#add wave sim:/tb/DEVARA/DRAGON/state
#add wave -r * 
run -all