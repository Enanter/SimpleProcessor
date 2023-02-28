onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /RF_tb/clk
add wave -noupdate /RF_tb/writeEn
add wave -noupdate -unsigned /RF_tb/wrAddr
add wave -noupdate -unsigned /RF_tb/wrData
add wave -noupdate -unsigned /RF_tb/rdAddrA
add wave -noupdate -unsigned /RF_tb/rdAddrB
add wave -noupdate -unsigned /RF_tb/rdDataA
add wave -noupdate -unsigned /RF_tb/rdDataB

TreeUpdate [SetDefaultTree]
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
