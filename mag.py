from sense_hat import SenseHat
from time import sleep
from math import *

sense = SenseHat()

#f1 = open("/home/pi/Desktop/hintensity.txt", "a+") #h'zontal intensity muT
#f2 = open("/home/pi/Desktop/tintensity.txt", "a+") #total intensity muT
#f3 = open("/home/pi/Desktop/declination.txt", "a+") #declination
#f4 = open("/home/pi/Desktop/inclination.txt", "a+") #inclination

for i in range(100):
  compass = sense.get_compass_raw()

  # Get raw data (values are swapped because Sense HAT on ISS is in different position)
  # x: northerly intensity
  # y: easterly intensity
  #  z: vertical intensity
  x = float(compass['z'])
  y = float(compass['y'])
  z = float(compass['x'])

  # h: horizontal intensity
  # f: total intensity
  # d: declination
  # i: inclination
  h = sqrt(x ** 2 + y ** 2)
  f = sqrt(h ** 2 + z ** 2)
  d = degrees(atan(y / x))
  ii = degrees(atan(z / h))


print(str(h),str(f), str(z) ) 

#  print('z: ' + str(z))
#  print('h: ' + str(h))
#  print('f: ' + str(f))
#  print

sleep(0.1)
