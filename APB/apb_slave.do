vlib work 
vdel -all
vlib work 

#vlog apb_slave_class.sv
#vlog apb_tb_class.sv

vlog apb_slave.sv
vlog apb_slave_tb.sv

vsim work.tb
do wave.do
#add wave sim:/tb/DEVARA/mem
#add wave -r * 
run -all