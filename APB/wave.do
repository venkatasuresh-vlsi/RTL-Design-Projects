onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb/PCLK
add wave -noupdate -radix unsigned /tb/PSEL
add wave -noupdate -radix unsigned /tb/PENABLE
add wave -noupdate -radix unsigned /tb/DEVARA/state
add wave -noupdate -radix unsigned /tb/PWRITE
add wave -noupdate -radix unsigned /tb/PADDR
add wave -noupdate -radix unsigned /tb/PWDATA
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[0]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[1]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[2]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[3]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[4]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[5]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[6]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[7]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[8]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[9]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[10]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[11]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[12]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[13]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[14]}
add wave -noupdate -radix unsigned {/tb/DEVARA/mem[15]}
add wave -noupdate -radix binary /tb/PSTRB
add wave -noupdate -radix unsigned /tb/PADDR
add wave -noupdate -radix unsigned /tb/PRDATA
add wave -noupdate -radix unsigned /tb/PREADY
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 252
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
WaveRestoreZoom {0 ps} {231 ps}
