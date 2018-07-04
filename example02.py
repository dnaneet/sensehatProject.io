#!/usr/bin/python
#This version samples temperature and relative humidity every 0.05 seconds for ~5 times and saves the arithmetic mean.  The previous version only obtained a single data point.  This version should and the arithmetic mean should help with the variability that single data point measurements fall prey to.
#
# Author: Aneet Narendranath,PhD, Date: 04-July-2018
#
from sense_hat import SenseHat
import io
import time
import csv
import numpy as np

sense = SenseHat()
sense.clear()
sense.set_rotation(90)

f = open("/home/pi/Desktop/temperature_test.txt", "a+") #Temperature
g = open("/home/pi/Desktop/rh_test.txt", "a+") #relative humidity

#loop to record every n seconds
n=3 #4 readings to go with the first reading of temperature and relative humidity
temp=np.array(sense.get_temperature()) #first reading, temperature
rh=np.array(sense.get_humidity()) #first reading, relative humidity
for i in range(n):
	temp = np.append(temp, sense.get_temperature())
	rh = np.append(rh, sense.get_humidity())
	time.sleep(0.05)

#print temp[1:] #Print for debugging
#print np.mean(temp[1:]) #Print for debugging

f.write('%s\n' % np.mean(temp)) #Average value of temperature for 5 consecutive readings
g.write('%s\n' % np.mean(rh))   #Average value of tempeature for 5 consecutive readings

f.close()
g.close()

##Code below may be used to measure cpu temperature
#f = open("/sys/class/thermal/thermal_zone0/temp", "r")
#f = open("/usr/bin/vcgencmd measure_temp", "r")
#t = f.readline ()
#cputemp = "CPU temp: "+t
#print (cputemp)

#eof
