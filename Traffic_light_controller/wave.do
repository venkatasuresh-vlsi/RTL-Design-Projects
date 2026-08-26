onerror {resume}
quietly virtual signal -install /tb { (context /tb )&{HWr , HWy , HWg , SWr , SWy , SWg }} signals
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/clk
add wave -noupdate /tb/veh
add wave -noupdate /tb/DEVARA/state
add wave -noupdate -radix unsigned /tb/DEVARA/cnt
add wave -noupdate /tb/signals
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {190 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
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
WaveRestoreZoom {0 ps} {342 ps}
