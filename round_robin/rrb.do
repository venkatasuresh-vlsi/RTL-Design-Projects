vlib work 
vdel -all
vlib work 

vlog rrb.v -sv
vlog rrb_tb.v 

vsim work.tb 
add wave -r *
run -all