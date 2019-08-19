#include <Servo.h> 
#define TRIG_PIN 2
#define ECHO_PIN 3
Servo servo;
void setup() {
  Serial.begin(9600);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  servo.attach(9);
}
unsigned int c = 10, delta = 1;
boolean working = true;
void loop() {
  if(Serial.available()){
    String str = Serial.readStringUntil('$');
    if(str == "pause") working = false;
    else if(str == "resume") working = true;
    else if(str != "") c = str.toInt();
  }
  servo.write(c);
  if(working == true) c = c + delta;
  delay(25);
  float dist = getDist(); // 원래는 measure()
  Serial.print(c);
  Serial.print(":");
  Serial.println(dist);
  if(c >= 170) delta = -1;
  else if(c <= 10) delta = 1;
}
float getDist(){
  float dist = 0;
  digitalWrite(TRIG_PIN, LOW);  
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH); 
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  dist = pulseIn(ECHO_PIN, HIGH, 30000) / 58.2;
  return dist;
}
