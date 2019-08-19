int[] dir = new int[45];
float[] range = new float[45];
int nowPos = 0;

void drawRadar(int a, float d){
  background(0);
  
  pushMatrix();
  translate(width/2, height);
  rotate(radians(180));
  
  if(d > 100) d = 100;
  dir[nowPos] = a;
  range[nowPos] = d;
  
  for(int i=0; i<45; i++) {
    int n = (nowPos - i + 45) % 45;
    pushMatrix();
    rotate(radians(dir[n]));
    stroke(0, 255, 0, 255-i*5);
    strokeWeight(3);
    line(0, 0, range[n]*2, 0);
    stroke(255, 0, 0, 255-i*5);
    line(range[n]*2, 0, 200, 0);
    popMatrix();
  }
  nowPos = (nowPos + 1) % 45;
  
  noFill();
  stroke(255, 255, 0);
  strokeWeight(1);
  arc(0, 0, 400, 400, radians(0), radians(180));
  arc(0, 0, 300, 300, radians(0), radians(180));
  arc(0, 0, 200, 200, radians(0), radians(180));
  arc(0, 0, 100, 100, radians(0), radians(180));
  for(int i=0; i<=12; i++) {
    pushMatrix();
    rotate(radians(15*i)); 
    line(0, 0, 200, 0);
    popMatrix();
  }
  
  popMatrix();
}