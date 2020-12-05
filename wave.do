onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/PC
add wave -noupdate /testbench/ACC
add wave -noupdate /testbench/INST
add wave -noupdate /testbench/dut/controller0/rIncPC
add wave -noupdate /testbench/dut/controller0/rLoadIR
add wave -noupdate /testbench/dut/controller0/C
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {421742 ps} 0}
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
WaveRestoreZoom {415896 ps} {501504 ps}
