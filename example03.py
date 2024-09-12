#!/usr/bin/python
from sense_hat import SenseHat
import io
import time
import csv
import numpy as np

sense = SenseHat()
sense.clear()
sense.set_rotation(90)

f = open("/home/pi/Desktop/temperature.txt", "a+") #Temperature
g = open("/home/pi/Desktop/rh.txt", "a+") #relative humidity

#loop to record every n seconds
n=9 #4 readings to go with the first reading of temperature and relative humidity
temp=np.array(sense.get_temperature()) #first reading, temperature
rh=np.array(sense.get_humidity()) #first reading, relative humidity
for i in range(n):
	temp = np.append(temp, sense.get_temperature())
	rh = np.append(rh, sense.get_humidity())
#	compass=sense.get_compass_raw()
#	x = float(compass['z'])
#	y = float(compass['y'])
#	z = float(compass['x'])
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
