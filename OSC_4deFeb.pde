import oscP5.*;
  
OscP5 oscP5;
int x,y,t,r,g,b;
boolean f;

void setup() {
  size(400,400);
  oscP5 = new OscP5(this,12000);
  x = width/2;
  y = height/2;
  t = 30;
  r = 255;
  g = 255;
  b = 255;
  f = true;
}


void draw() {
  if (f){
    background(0);  
  }
  noStroke();
  fill(r,g,b);
  ellipse(x,y,t,t);
}

void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.addrPattern().equals("/x")){
    x = theOscMessage.get(0).intValue();
  }
  if(theOscMessage.addrPattern().equals("/y")){
    y = theOscMessage.get(0).intValue();
  }
  if(theOscMessage.addrPattern().equals("/t")){
    t = theOscMessage.get(0).intValue();
  }
  if(theOscMessage.addrPattern().equals("/r")){
    r = theOscMessage.get(0).intValue();
  }
  if(theOscMessage.addrPattern().equals("/g")){
    g = theOscMessage.get(0).intValue();
  }
  if(theOscMessage.addrPattern().equals("/b")){
    b = theOscMessage.get(0).intValue();
  }
  if(theOscMessage.addrPattern().equals("/f")){
    int val = theOscMessage.get(0).intValue();
    if (val == 1){
      f = true;
    }
    if(val == 0){
      f = false;
    }
  }
}
