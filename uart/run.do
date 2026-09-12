vlib work 
vdel -all
vlib work 

vlog uart_tx.v -sv
vlog uart_rx.v -sv 
vlog uart_tb.v 

vsim work.tb
#add wave -r *
do wave.do
run -all