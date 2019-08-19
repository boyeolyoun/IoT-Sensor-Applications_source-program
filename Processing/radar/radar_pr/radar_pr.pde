import processing.serial.*;
Serial serial;
void setup(){
  size(400, 300);
  textSize(12);
  textAlign(CENTER, CENTER);
  serial = new Serial(this, "COM6", 19200);
}
void draw(){
  if(serial.available() > 0) {
    String str = serial.readStringUntil('\n');
    if(str != null) {
      String [] cmd = splitTokens(str, ":\r");
      if(cmd.length > 2) {
        int angle = int(cmd[0]);
        float dist = float(cmd[1]);
        //println("*" + angle + "=" + dist);
        drawRadar(angle, dist);
      }
    }
  }
  drawButton(20, 20, 100, 20, "Pause");  
  drawButton(20, 50, 100, 20, "Resume");
}

void drawButton(int x, int y, int w, int h, String str){
  fill(255, 255, 0);
  rect(x, y, w, h);
  fill(0);
  text(str, x+w/2, y+h/2);
}

void mouseClicked(){
  if(mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 40)
    serial.write("pause$");
  else if(mouseX > 20 && mouseX < 120 && mouseY > 50 && mouseY < 70)
    serial.write("resume$");
}