vlib work 
vdel -all
vlib work 

vlog hms.v -sv
vlog hms_tb.v +define+M2

vsim work.tb 
#add wave -r *
do wave.do
run -all