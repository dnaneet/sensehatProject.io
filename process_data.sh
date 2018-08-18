#!/bin/bash

#''Run python script to collect and store temperature and rel humidity data''#
/usr/bin/python /home/pi/Desktop/example02.py

#awk '{p=f;f=$1} NR>1{print f-p}' /home/pi/Desktop/temperature.txt >> dT.txt
#awk '{p=f;f=$1} NR>1{print f-p}' /home/pi/Desktop/rh.txt >> dr.txt
#Plot data
#/usr/bin/gnuplot /home/pi/Desktop/piplot.sh
#/home/pi/Desktop/./process_data_ws.sh

#''Plotting''#
/home/pi/Desktop/./comfort.sh #Gnuplot to plot the collected data, 2018-Aug-18

#''Upload data to dropbox''#
#Upload data to dropbox
/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/rh.txt /sensehat 
/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/temperature.txt /sensehat


#/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload $(ls -ltrh /home/pi/Desktop/rh*.pdf  | tail -n 1 | awk '{print $9}') /sensehat
#/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload $(ls -ltrh /home/pi/Desktop/T*.pdf  | tail -n 1 | awk '{print $9}') /sensehat

#''Upload plot to dropbox''#
/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload $(ls -ltrh /home/pi/Desktop/comfort*.pdf  | tail -n 1 | awk '{print $9}') /sensehat

/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/$(date -d "yesterday 13:00" '+%y-%m-%d').temperature.txt /sensehat/data
/home/pi/Dropbox-Uploader/./dropbox_uploader.sh upload /home/pi/Desktop/$(date -d "yesterday 13:00" '+%y-%m-%d').rh.txt /sensehat/data


#rm /home/pi/Desktop/*.png
