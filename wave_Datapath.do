onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -unsigned /Datapath_tb/ALUSelect
add wave -noupdate -hexadecimal /Datapath_tb/DAddr
add wave -noupdate -unsigned /Datapath_tb/Clk
add wave -noupdate -hexadecimal /Datapath_tb/ReadAddrA
add wave -noupdate -hexadecimal /Datapath_tb/DUT.RDataA
add wave -noupdate -hexadecimal /Datapath_tb/DUT.RDataB
add wave -noupdate -unsigned /Datapath_tb/RFSelect
add wave -noupdate -hexadecimal /Datapath_tb/ReadAddrB
add wave -noupdate -hexadecimal /Datapath_tb/ReadAddrB
add wave -noupdate -hexadecimal /Datapath_tb/WriteAddr
add wave -noupdate -unsigned /Datapath_tb/RF_En
add wave -noupdate -unsigned /Datapath_tb/Write_En
add wave -noupdate -hexadecimal /Datapath_tb/ALUOut
add wave -noupdate -hexadecimal /Datapath_tb/ALUAIn
add wave -noupdate -hexadecimal /Datapath_tb/ALUBIn
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
