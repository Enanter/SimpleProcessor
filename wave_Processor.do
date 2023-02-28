onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -unsigned /testProcessor/Clk
add wave -noupdate -unsigned /testProcessor/Reset
add wave -noupdate -hexadecimal /testProcessor/IR_Out
add wave -noupdate -unsigned /testProcessor/PC_Out
add wave -noupdate -hexadecimal /testProcessor/State
add wave -noupdate -hexadecimal /testProcessor/NextState
add wave -noupdate -hexadecimal /testProcessor/ALU_A
add wave -noupdate -hexadecimal /testProcessor/ALU_B
add wave -noupdate -hexadecimal /testProcessor/ALU_Out
add wave -noupdate -hexadecimal /testProcessor/DUT.DAddr
add wave -noupdate -hexadecimal /testProcessor/DUT.RFAReadAddr
add wave -noupdate -hexadecimal /testProcessor/DUT.RFBReadAddr
add wave -noupdate -hexadecimal /testProcessor/DUT.RFWriteAddr
add wave -noupdate -hexadecimal /testProcessor/DUT.RFWriteEnable
add wave -noupdate -unsigned /testProcessor/DUT.RFSelect
add wave -noupdate -unsigned /testProcessor/DUT.DWrite
add wave -noupdate -unsigned /testProcessor/DUT.ALUSelect


WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {1 ns}
