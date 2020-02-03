import Adafruit_DHT
import time
import datetime
import urllib.request
import urllib.error

sensor = Adafruit_DHT.DHT11
pin = 4

while True:
    wtime=datetime.datetime.now()
    h, temp = Adafruit_DHT.read_retry(sensor, pin)

    if h is not None and temp is not None:
        print(wtime, "Temp={0:0.1f}C Humidity={1:0.1f}%". format(temp, h))
        time.sleep(2)

        html = urllib.request.urlopen("https://api.thingspeak.com/update?api_key=WXLEWAMO5C79GW21&field1="+str(temp)+"&field2="+str(h))
    else:
        print('Failed to get reading. Try again!')
