vlib work 
vdel -all
vlib work 

vlog tlc.v -sv
vlog tlc_tb.v 

vsim work.tb
#add wave -r *
do wave.do
run -all