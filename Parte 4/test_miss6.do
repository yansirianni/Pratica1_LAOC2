onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Input
add wave -noupdate /cache2vias/clock
add wave -noupdate /cache2vias/addr
add wave -noupdate /cache2vias/wren
add wave -noupdate /cache2vias/data_in
add wave -noupdate -divider Hit/Miss
add wave -noupdate -format Literal -radix binary /cache2vias/hit
add wave -noupdate -format Literal -radix binary /cache2vias/miss
add wave -noupdate -divider Output
add wave -noupdate -format Literal -radix binary /cache2vias/lru_via1
add wave -noupdate -format Literal -radix binary /cache2vias/lru_via2
add wave -noupdate -radix binary -childformat {{{/cache2vias/d_out_mux1[11]} -radix binary} {{/cache2vias/d_out_mux1[10]} -radix binary} {{/cache2vias/d_out_mux1[9]} -radix binary} {{/cache2vias/d_out_mux1[8]} -radix binary} {{/cache2vias/d_out_mux1[7]} -radix binary} {{/cache2vias/d_out_mux1[6]} -radix binary} {{/cache2vias/d_out_mux1[5]} -radix binary} {{/cache2vias/d_out_mux1[4]} -radix binary} {{/cache2vias/d_out_mux1[3]} -radix binary} {{/cache2vias/d_out_mux1[2]} -radix binary} {{/cache2vias/d_out_mux1[1]} -radix binary} {{/cache2vias/d_out_mux1[0]} -radix binary}} -subitemconfig {{/cache2vias/d_out_mux1[11]} {-height 15 -radix binary} {/cache2vias/d_out_mux1[10]} {-height 15 -radix binary} {/cache2vias/d_out_mux1[9]} {-height 15 -radix binary} {/cache2vias/d_out_mux1[8]} {-height 15 -radix binary} {/cache2vias/d_out_mux1[7]} {-height 15 -radix binary} {/cache2vias/d_out_mux1[6]} {-height 15 -radix binary} {/cache2vias/d_out_mux1[5]} {-height 15 -radix binary} {/cache2vias/d_out_mux1[4]} {-height 15 -radix binary} {/cache2vias/d_out_mux1[3]} {-height 15 -radix binary} {/cache2vias/d_out_mux1[2]} {-height 15 -radix binary} {/cache2vias/d_out_mux1[1]} {-height 15 -radix binary} {/cache2vias/d_out_mux1[0]} {-height 15 -radix binary}} /cache2vias/d_out_mux1
add wave -noupdate -radix binary -childformat {{{/cache2vias/d_out_mux2[11]} -radix binary} {{/cache2vias/d_out_mux2[10]} -radix binary} {{/cache2vias/d_out_mux2[9]} -radix binary} {{/cache2vias/d_out_mux2[8]} -radix binary} {{/cache2vias/d_out_mux2[7]} -radix binary} {{/cache2vias/d_out_mux2[6]} -radix binary} {{/cache2vias/d_out_mux2[5]} -radix binary} {{/cache2vias/d_out_mux2[4]} -radix binary} {{/cache2vias/d_out_mux2[3]} -radix binary} {{/cache2vias/d_out_mux2[2]} -radix binary} {{/cache2vias/d_out_mux2[1]} -radix binary} {{/cache2vias/d_out_mux2[0]} -radix binary}} -subitemconfig {{/cache2vias/d_out_mux2[11]} {-height 15 -radix binary} {/cache2vias/d_out_mux2[10]} {-height 15 -radix binary} {/cache2vias/d_out_mux2[9]} {-height 15 -radix binary} {/cache2vias/d_out_mux2[8]} {-height 15 -radix binary} {/cache2vias/d_out_mux2[7]} {-height 15 -radix binary} {/cache2vias/d_out_mux2[6]} {-height 15 -radix binary} {/cache2vias/d_out_mux2[5]} {-height 15 -radix binary} {/cache2vias/d_out_mux2[4]} {-height 15 -radix binary} {/cache2vias/d_out_mux2[3]} {-height 15 -radix binary} {/cache2vias/d_out_mux2[2]} {-height 15 -radix binary} {/cache2vias/d_out_mux2[1]} {-height 15 -radix binary} {/cache2vias/d_out_mux2[0]} {-height 15 -radix binary}} /cache2vias/d_out_mux2
add wave -noupdate -radix binary -childformat {{{/cache2vias/data_out_via1[11]} -radix binary} {{/cache2vias/data_out_via1[10]} -radix binary} {{/cache2vias/data_out_via1[9]} -radix binary} {{/cache2vias/data_out_via1[8]} -radix binary} {{/cache2vias/data_out_via1[7]} -radix binary} {{/cache2vias/data_out_via1[6]} -radix binary} {{/cache2vias/data_out_via1[5]} -radix binary} {{/cache2vias/data_out_via1[4]} -radix binary} {{/cache2vias/data_out_via1[3]} -radix binary} {{/cache2vias/data_out_via1[2]} -radix binary} {{/cache2vias/data_out_via1[1]} -radix binary} {{/cache2vias/data_out_via1[0]} -radix binary}} -subitemconfig {{/cache2vias/data_out_via1[11]} {-height 15 -radix binary} {/cache2vias/data_out_via1[10]} {-height 15 -radix binary} {/cache2vias/data_out_via1[9]} {-height 15 -radix binary} {/cache2vias/data_out_via1[8]} {-height 15 -radix binary} {/cache2vias/data_out_via1[7]} {-height 15 -radix binary} {/cache2vias/data_out_via1[6]} {-height 15 -radix binary} {/cache2vias/data_out_via1[5]} {-height 15 -radix binary} {/cache2vias/data_out_via1[4]} {-height 15 -radix binary} {/cache2vias/data_out_via1[3]} {-height 15 -radix binary} {/cache2vias/data_out_via1[2]} {-height 15 -radix binary} {/cache2vias/data_out_via1[1]} {-height 15 -radix binary} {/cache2vias/data_out_via1[0]} {-height 15 -radix binary}} /cache2vias/data_out_via1
add wave -noupdate -radix binary -childformat {{{/cache2vias/data_out_via2[11]} -radix binary} {{/cache2vias/data_out_via2[10]} -radix binary} {{/cache2vias/data_out_via2[9]} -radix binary} {{/cache2vias/data_out_via2[8]} -radix binary} {{/cache2vias/data_out_via2[7]} -radix binary} {{/cache2vias/data_out_via2[6]} -radix binary} {{/cache2vias/data_out_via2[5]} -radix binary} {{/cache2vias/data_out_via2[4]} -radix binary} {{/cache2vias/data_out_via2[3]} -radix binary} {{/cache2vias/data_out_via2[2]} -radix binary} {{/cache2vias/data_out_via2[1]} -radix binary} {{/cache2vias/data_out_via2[0]} -radix binary}} -subitemconfig {{/cache2vias/data_out_via2[11]} {-height 15 -radix binary} {/cache2vias/data_out_via2[10]} {-height 15 -radix binary} {/cache2vias/data_out_via2[9]} {-height 15 -radix binary} {/cache2vias/data_out_via2[8]} {-height 15 -radix binary} {/cache2vias/data_out_via2[7]} {-height 15 -radix binary} {/cache2vias/data_out_via2[6]} {-height 15 -radix binary} {/cache2vias/data_out_via2[5]} {-height 15 -radix binary} {/cache2vias/data_out_via2[4]} {-height 15 -radix binary} {/cache2vias/data_out_via2[3]} {-height 15 -radix binary} {/cache2vias/data_out_via2[2]} {-height 15 -radix binary} {/cache2vias/data_out_via2[1]} {-height 15 -radix binary} {/cache2vias/data_out_via2[0]} {-height 15 -radix binary}} /cache2vias/data_out_via2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {803 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
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
WaveRestoreZoom {3 ps} {868 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/cache2vias/clock 
wave create -driver freeze -pattern constant -value 0 -range 4 0 -starttime 0ps -endtime 1000ps sim:/cache2vias/addr 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/cache2vias/wren 
wave create -driver freeze -pattern random -initialvalue 0 -period 50ps -random_type Uniform -seed 5 -range 7 0 -starttime 0ps -endtime 1000ps sim:/cache2vias/data_in 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00001 -range 4 0 -starttime 200ps -endtime 400ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern constant -value 00010 -range 4 0 -starttime 400ps -endtime 600ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern constant -value 00001 -range 4 0 -starttime 200ps -endtime 400ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern constant -value 00010 -range 4 0 -starttime 400ps -endtime 600ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/cache2vias/clock 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/cache2vias/clock 
wave modify -driver freeze -pattern random -initialvalue 00000000 -period 200ps -random_type Uniform -seed 5 -range 7 0 -starttime 0ps -endtime 1000ps Edit:/cache2vias/data_in 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/cache2vias/clock 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/cache2vias/clock 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/cache2vias/clock 
wave modify -driver freeze -pattern random -initialvalue 00000000 -period 250ps -random_type Uniform -seed 5 -range 7 0 -starttime 0ps -endtime 1000ps Edit:/cache2vias/data_in 
wave modify -driver freeze -pattern constant -value 00000 -range 4 0 -starttime 0ps -endtime 1000ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/cache2vias/clock 
wave modify -driver freeze -pattern constant -value 00001 -range 4 0 -starttime 400ps -endtime 800ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern random -initialvalue 00000000 -period 400ps -random_type Uniform -seed 5 -range 7 0 -starttime 0ps -endtime 1000ps Edit:/cache2vias/data_in 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/cache2vias/clock 
wave modify -driver freeze -pattern constant -value 00000 -range 4 0 -starttime 400ps -endtime 800ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern constant -value 00001 -range 4 0 -starttime 250ps -endtime 500ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern constant -value 00010 -range 4 0 -starttime 500ps -endtime 750ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern random -initialvalue 00000000 -period 250ps -random_type Uniform -seed 5 -range 7 0 -starttime 0ps -endtime 1000ps Edit:/cache2vias/data_in 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/cache2vias/clock 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/cache2vias/clock 
wave modify -driver freeze -pattern clock -initialvalue St0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1250ps Edit:/cache2vias/clock 
wave modify -driver freeze -pattern constant -value 00001 -range 4 0 -starttime 1000ps -endtime 1250ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1250ps Edit:/cache2vias/wren 
wave modify -driver freeze -pattern random -initialvalue 00000000 -period 250ps -random_type Uniform -seed 5 -range 7 0 -starttime 0ps -endtime 1250ps Edit:/cache2vias/data_in 
wave modify -driver freeze -pattern constant -value 00000 -range 4 0 -starttime 500ps -endtime 1250ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern constant -value 00010 -range 4 0 -starttime 500ps -endtime 1250ps Edit:/cache2vias/addr 
wave modify -driver freeze -pattern constant -value 00000 -range 4 0 -starttime 500ps -endtime 1250ps Edit:/cache2vias/addr 
WaveCollapseAll -1
wave clipboard restore
