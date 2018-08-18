#!/usr/bin/gnuplot -persist
#set terminal postscript landscape noenhanced monochrome \
#              dashed defaultplex "Helvetica" 14
#set terminal pdf size 400,300 enhanced font "Helvetica,20"
set terminal postscript defaultplex "Helvetica" 20
date = system("date +%F")
#set output '| ps2pdf - comfort.pdf'
set output '| ps2pdf - comfort.'.date.'.pdf'

set multiplot layout 2, 1 title "Comfort by the Harp"
set nokey
set title "RH"
set xlabel "time"
set ylabel "RH"
set xrange [ 0 : 287 ] noreverse nowriteback
set yrange [ 45 : 70 ] noreverse nowriteback
plot "rh.txt" using 1

set nokey
set xlabel "time"
set ylabel "temperature"
set xrange [ 0 : 287 ]
set yrange [ 20 : 30 ]
set title "Temperature"
plot "temperature.txt" using 1 lc 2

#eof
