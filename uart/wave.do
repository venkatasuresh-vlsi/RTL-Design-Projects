onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider GLOBAL
add wave -noupdate /tb/clk
add wave -noupdate /tb/tx_start
add wave -noupdate /tb/tx_data
add wave -noupdate /tb/tx
add wave -noupdate /tb/tx_busy
add wave -noupdate /tb/rx_data
add wave -noupdate /tb/rx_valid
add wave -noupdate -divider TX
add wave -noupdate /tb/TX/tx_temp
add wave -noupdate -radix unsigned /tb/TX/state
add wave -noupdate -radix unsigned /tb/TX/baud_cnt
add wave -noupdate -radix unsigned /tb/TX/bit_cnt
add wave -noupdate -divider RX
add wave -noupdate /tb/RX/syn_rx
add wave -noupdate -radix unsigned /tb/RX/state
add wave -noupdate -radix unsigned /tb/RX/baud_cnt
add wave -noupdate -radix unsigned /tb/RX/bit_cnt
add wave -noupdate /tb/RX/rx_temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {293626 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 289
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {546940 ps}
