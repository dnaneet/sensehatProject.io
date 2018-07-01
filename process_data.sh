#!/bin/bash

#Run python script to collect and store temperature and rel humidity data
/usr/bin/python /home/pi/Desktop/example00.py
#awk '{p=f;f=$1} NR>1{print f-p}' /home/pi/Desktop/temperature.txt >> dT.txt
#awk '{p=f;f=$1} NR>1{print f-p}' /home/pi/Desktop/rh.txt >> dr.txt
#Plot data
#/usr/bin/gnuplot /home/pi/Desktop/piplot.sh

#Upload data to dropbox
/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/rh.txt /sensehat 

/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/temperature.txt /sensehat

#/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/tempws.png /sensehat

#/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/rhws.png /sensehat

/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/*.png /sensehat

rm /home/pi/Desktop/*.png
