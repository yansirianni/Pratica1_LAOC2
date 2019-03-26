onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Parte_2/CLOCK_50
add wave -noupdate /Parte_2/SW
add wave -noupdate /Parte_2/HEX7
add wave -noupdate /Parte_2/HEX6
add wave -noupdate /Parte_2/HEX5
add wave -noupdate /Parte_2/HEX4
add wave -noupdate /Parte_2/HEX3
add wave -noupdate /Parte_2/HEX2
add wave -noupdate /Parte_2/HEX1
add wave -noupdate /Parte_2/HEX0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {641 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 138
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
WaveRestoreZoom {0 ps} {861 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 000000010010000000 -range 17 0 -starttime 0ps -endtime 100ps sim:/Parte_2/SW 
wave create -driver freeze -pattern constant -value 000000010010000000 -range 17 0 -starttime 0ps -endtime 100ps sim:/Parte_2/SW 
wave create -driver freeze -pattern constant -value 000000010010000000 -range 17 0 -starttime 0ps -endtime 100ps sim:/Parte_2/SW 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 000000000000000000 -range 17 0 -starttime 0ps -endtime 200ps Edit:/Parte_2/SW 
wave modify -driver freeze -pattern constant -value 000000000000000001 -range 17 0 -starttime 200ps -endtime 400ps Edit:/Parte_2/SW 
wave modify -driver freeze -pattern constant -value 000000000000000010 -range 17 0 -starttime 400ps -endtime 600ps Edit:/Parte_2/SW 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/Parte_2/CLOCK_50 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/Parte_2/CLOCK_50 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/Parte_2/CLOCK_50 
wave modify -driver freeze -pattern constant -value 000000000000000011 -range 17 0 -starttime 600ps -endtime 800ps Edit:/Parte_2/SW 
WaveCollapseAll -1
wave clipboard restore
