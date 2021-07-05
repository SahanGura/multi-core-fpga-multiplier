onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /processor_tb/clk
add wave -noupdate /processor_tb/ins
add wave -noupdate /processor_tb/dut/core2/ar/data_out_dm
add wave -noupdate /processor_tb/dut/core2/ar/data_out_im
add wave -noupdate /processor_tb/dut/core2/tr/data_out
add wave -noupdate /processor_tb/dut/core3/tr/data_out
add wave -noupdate /processor_tb/dut/core3/ar/data_out_dm
add wave -noupdate /processor_tb/dut/core3/ar/data_out_im
add wave -noupdate /processor_tb/dut/core4/tr/data_out
add wave -noupdate /processor_tb/dut/core4/ar/data_out_dm
add wave -noupdate /processor_tb/dut/core4/ar/data_out_im
add wave -noupdate /processor_tb/dut/core2/ir/data_out
add wave -noupdate /processor_tb/dut/core3/ir/data_out
add wave -noupdate /processor_tb/dut/core4/ir/data_out
add wave -noupdate /processor_tb/dut/core2/rx/data_out
add wave -noupdate /processor_tb/dut/core3/rx/data_out
add wave -noupdate /processor_tb/dut/core4/rx/data_out
add wave -noupdate /processor_tb/dut/core2/ac/z
add wave -noupdate /processor_tb/dut/core3/ac/z
add wave -noupdate /processor_tb/dut/core4/ac/z
add wave -noupdate /processor_tb/dut/core2/ac/data_out
add wave -noupdate /processor_tb/dut/core3/ac/data_out
add wave -noupdate /processor_tb/dut/core4/ac/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {40799223 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 251
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
WaveRestoreZoom {39565182 ps} {47768390 ps}
