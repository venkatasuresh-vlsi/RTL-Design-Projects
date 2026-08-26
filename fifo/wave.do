onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/clk
add wave -noupdate /tb/wr
add wave -noupdate -radix unsigned /tb/wrptr
add wave -noupdate -radix unsigned /tb/din
add wave -noupdate -radix unsigned -childformat {{{/tb/Suresh/box[1]} -radix unsigned} {{/tb/Suresh/box[2]} -radix unsigned} {{/tb/Suresh/box[3]} -radix unsigned} {{/tb/Suresh/box[4]} -radix unsigned} {{/tb/Suresh/box[5]} -radix unsigned} {{/tb/Suresh/box[6]} -radix unsigned} {{/tb/Suresh/box[7]} -radix unsigned} {{/tb/Suresh/box[8]} -radix unsigned} {{/tb/Suresh/box[9]} -radix unsigned} {{/tb/Suresh/box[10]} -radix unsigned}} -expand -subitemconfig {{/tb/Suresh/box[1]} {-radix unsigned} {/tb/Suresh/box[2]} {-radix unsigned} {/tb/Suresh/box[3]} {-radix unsigned} {/tb/Suresh/box[4]} {-radix unsigned} {/tb/Suresh/box[5]} {-radix unsigned} {/tb/Suresh/box[6]} {-radix unsigned} {/tb/Suresh/box[7]} {-radix unsigned} {/tb/Suresh/box[8]} {-radix unsigned} {/tb/Suresh/box[9]} {-radix unsigned} {/tb/Suresh/box[10]} {-radix unsigned}} /tb/Suresh/box
add wave -noupdate /tb/rd
add wave -noupdate -radix unsigned /tb/rdptr
add wave -noupdate -radix unsigned /tb/dout
add wave -noupdate /tb/full
add wave -noupdate /tb/empty
add wave -noupdate /tb/Suresh/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 224
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
WaveRestoreZoom {0 ps} {470 ps}
