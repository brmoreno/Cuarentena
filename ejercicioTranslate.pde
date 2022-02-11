void setup(){
  size(600,600);
  background(255);
}
float r = 0;
float d = 1;
void draw(){
  r+=0.01;
  background(255);  
  translate(mouseX,mouseY);
  rotate(r);
  ellipse(0,0,30,30);
  rect(0,0,200,200);
}
