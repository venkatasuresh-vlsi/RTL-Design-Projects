vlib work 
vdel -all
vlib work 

vlog lift_controller.v -sv 
vlog lift_controller_tb.v 

vsim work.tb 
do wave.do
#add wave -r * 
run -all