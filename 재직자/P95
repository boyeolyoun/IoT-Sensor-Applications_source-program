import time
import Adafruit_DHT
import psycopg2

sensor = Adafruit_DHT.DHT11
pin = 4 # physical 7
month_string = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep",\
"Oct", "Nov", "Dec"]
month_num = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]

conn = psycopg2.connect("host=localhost dbname=dht11 user=postgres password=1234")
conn.autocommit = True
cur = conn.cursor()

try:
    while True:
        humidity, temperature = Adafruit_DHT.read_retry(sensor, pin)
        time_split = time.ctime().split(" ")
        year = time_split[4]
        month = time_split[1]
        day = time_split[2]
        week = time_split[0]
        current_time = time_split[3]

        for i in range(0, 12):
            if month == month_string[i]:
                month = month_num[i]
                break
        
        cur.execute("INSERT INTO dht11 VALUES('{}.{}.{} {}', '{}', '{}')".format\
(year, month, day, current_time, temperature, humidity))

        print("{}.{}.{} / {} / Temperature: {} C, Humidity: {}%".format(year, month,\
day, current_time, temperature, humidity))
        time.sleep(2)
except:
    cur.close()
    conn.close()
