view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/mapRam2Cache/clock 
wave create -driver freeze -pattern constant -value 0 -range 17 0 -starttime 0ps -endtime 1000ps sim:/mapRam2Cache/SW 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 000000000000000001 -range 17 0 -starttime 200ps -endtime 400ps Edit:/mapRam2Cache/SW 
wave modify -driver freeze -pattern constant -value 000000000000000010 -range 17 0 -starttime 400ps -endtime 600ps Edit:/mapRam2Cache/SW 
wave modify -driver freeze -pattern constant -value 000000000000000010 -range 17 0 -starttime 400ps -endtime 600ps Edit:/mapRam2Cache/SW 
wave modify -driver freeze -pattern constant -value 000000000000001000 -range 17 0 -starttime 600ps -endtime 800ps Edit:/mapRam2Cache/SW 
WaveCollapseAll -1
wave clipboard restore
