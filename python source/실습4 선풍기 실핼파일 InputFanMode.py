import RPi.GPIO as GPIO
import InputFanModule as Fan

FAN_IA = 23 #physic 16
FAN_IB = 24 #physic 18

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(FAN_IA, GPIO.OUT)
GPIO.setup(FAN_IB, GPIO.OUT)


if __name__ == "__main__" :
    try :
        while True :
            var = input("choice Fan Mode : ")
            if var == 'q' or var =='Q' :
                print ("Stop")
                Fan.StopFan(GPIO, FAN_IA, FAN_IB)
            elif var == 'w' or var =='W' :
                print ("Weak")
                Fan.Weak(GPIO, FAN_IA, FAN_IB)
            elif var == 'm' or var =='M' :
                print ("Medium")
                Fan.Medium(GPIO, FAN_IA, FAN_IB)
            elif var == 's' or var =='S' :
                print ("Strong")
                Fan.Strong(GPIO, FAN_IA, FAN_IB)

    except KeyboardInterrupt:
        
        GPIO.cleanup()
        print("end")
