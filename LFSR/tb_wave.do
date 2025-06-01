onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /LFSR_n_tb/clk
add wave -noupdate /LFSR_n_tb/rst
add wave -noupdate /LFSR_n_tb/ena
add wave -noupdate -radix unsigned /LFSR_n_tb/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {385 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 132
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {332 ps}
