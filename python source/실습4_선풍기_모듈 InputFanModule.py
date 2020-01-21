import RPi.GPIO as GPIO
import time

FAN_IA = 23 #physic 16
FAN_IB = 24 #physic 18

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(FAN_IA, GPIO.OUT)
GPIO.setup(FAN_IB, GPIO.OUT)

pa = GPIO.PWM(FAN_IA, 100)
pb = GPIO.PWM(FAN_IB, 100)
pa.start(0)
pb.start(0)

def StopFan(GPIO, FAN_IA, FAN_IB) :
    pa.ChangeDutyCycle(0)
    pb.ChangeDutyCycle(0)
        
def Weak(GPIO, FAN_IA, FAN_IB) :
    pa.ChangeDutyCycle(33)
    pb.ChangeDutyCycle(0)

def Medium(GPIO, FAN_IA, FAN_IB) :
    pa.ChangeDutyCycle(66)
    pb.ChangeDutyCycle(0)

def Strong(GPIO, FAN_IA, FAN_IB) :
    pa.ChangeDutyCycle(100)
    pb.ChangeDutyCycle(0)    
