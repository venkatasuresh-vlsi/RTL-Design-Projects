vlib work
vdel -all
vlib work

vlog fifo.v +acc -sv
vlog fifo_tb.v +acc

vsim work.tb 
#add wave -r *
do wave.do
run -all