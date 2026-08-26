onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider MASTER_SIGNALS
add wave -noupdate -radix unsigned /tb/PCLK
add wave -noupdate -radix unsigned /tb/start
add wave -noupdate /tb/DEVARA/DRAGON/state
add wave -noupdate -radix unsigned /tb/rw
add wave -noupdate -radix unsigned /tb/addr
add wave -noupdate -radix hexadecimal /tb/wdata
add wave -noupdate -radix unsigned /tb/strb
add wave -noupdate -radix hexadecimal /tb/rdata
add wave -noupdate -radix unsigned /tb/done
add wave -noupdate -divider SLAVE_SIGNALS
add wave -noupdate -radix unsigned /tb/PCLK
add wave -noupdate -radix unsigned /tb/DEVARA/PSEL
add wave -noupdate -radix unsigned /tb/DEVARA/PENABLE
add wave -noupdate -radix unsigned /tb/DEVARA/DEVARA/state
add wave -noupdate -radix unsigned /tb/DEVARA/PWRITE
add wave -noupdate -radix hexadecimal /tb/DEVARA/PWDATA
add wave -noupdate -radix unsigned /tb/DEVARA/PADDR
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[0]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[1]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[2]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[3]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[4]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[5]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[6]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[7]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[8]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[9]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[10]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[11]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[12]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[13]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[14]}
add wave -noupdate -radix hexadecimal {/tb/DEVARA/DEVARA/mem[15]}
add wave -noupdate -radix unsigned /tb/DEVARA/PSTRB
add wave -noupdate -radix unsigned /tb/DEVARA/PADDR
add wave -noupdate -radix hexadecimal /tb/DEVARA/PRDATA
add wave -noupdate -radix unsigned /tb/DEVARA/PREADY
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2045 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 254
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
WaveRestoreZoom {1952 ps} {2260 ps}
