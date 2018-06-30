set terminal pngcairo
set output  "/home/pi/Desktop/temperature.png" 
set title "Temperature vs. Time "
set xlabel "Time"
set ylabel "Temperature (C)"
set yrange [10:45]
set key off #No legend
plot "/home/pi/Desktop/temperature.txt" using 1 with points pt 7 ps 2

set output "/home/pi/Desktop/rh.png"
set title "Relative humidity vs. Time"
set xlabel "Time"
set ylabel "R.H (%)"
set yrange [0:100]
set key off 
plot "/home/pi/Desktop/rh.txt" using 1 with points pt 4 ps 2

