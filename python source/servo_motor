import RPi.GPIO as GPIO
import time

pin = 18
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(pin, GPIO.OUT)

p = GPIO.PWM(pin, 50)
p.start(0)

left_angle = 12.5
center_angle = 7.5
right_angle = 2.5

def doAngle(angle):
    p.ChangeDutyCycle(angle)
    print ("Angle: %d" %angle)
    time.sleep(0.5)

try :

    while True:
        var = input("Enter L/R/C :")
        if var == 'R' or var == 'r' :
            print ("Right")
            doAngle(right_angle)
        elif var == 'L' or var == 'l':
            print ("Left")
            doAngle(left_angle)
        elif var == 'C' or var == 'c':
            print ("Center")
            doAngle(center_angle)

except KeyboardInterrupt:
    p.stop()
    
GPIO.cleanup()    
