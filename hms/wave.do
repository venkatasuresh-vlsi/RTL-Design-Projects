onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/clk
add wave -noupdate /tb/sel
add wave -noupdate /tb/inc
add wave -noupdate /tb/dec
add wave -noupdate /tb/rel
add wave -noupdate -radix unsigned /tb/hrs
add wave -noupdate -radix unsigned /tb/min
add wave -noupdate -radix unsigned /tb/sec
add wave -noupdate /tb/DEVARA/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {218 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {250 ps}
