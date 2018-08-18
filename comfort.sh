#!/usr/bin/gnuplot -persist
#set terminal postscript landscape noenhanced monochrome \
#              dashed defaultplex "Helvetica" 14
#set terminal pdf size 400,300 enhanced font "Helvetica,20"
set terminal postscript defaultplex "Helvetica" 20
date = system("date +%F")
#set output '| ps2pdf - comfort.pdf'
set output '| ps2pdf - /home/pi/Desktop/comfort.'.date.'.pdf'

set multiplot layout 2, 1 title "Comfort by the Harp"
set nokey
set xlabel "time"
set ylabel "RH"
set xrange [ 0 : 287 ] noreverse nowriteback
set yrange [ 45 : 70 ] noreverse nowriteback
set arrow from 72, graph 0 to 72, graph 1 nohead
set arrow from 144, graph 0 to 144, graph 1 nohead
set arrow from 216, graph 0 to 216, graph 1 nohead

plot "/home/pi/Desktop/rh.txt" using 1

set y2tics
ymin=20
ymax=30
set nokey
set xlabel "time"
set ylabel "temperature"
set xrange [ 0 : 287 ]
set yrange [ ymin : ymax ]
set y2range [ ymin*1.8 + 32 : ymax*1.8 + 32 ]
plot "/home/pi/Desktop/temperature.txt" using 1

#eof
