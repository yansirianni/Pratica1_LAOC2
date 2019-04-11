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
WaveCollapseAll -1
wave clipboard restore
