import oscP5.*;
  
OscP5 oscP5;
int x;

void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this,12000);
  x = 0;
}


void draw() {
  background(0);  
  ellipse(x,200,40,40);
}

void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.addrPattern().equals("/x")){
    x = theOscMessage.get(0).intValue();
  }
}
