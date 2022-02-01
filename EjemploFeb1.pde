//Variables globales
float x;
float y;
float t;
float r;
float b; 
float g;
float dx;


//setup
void setup(){
  size(500,500);
  background(255);
  x = 250;
  y = 250;
  t = 100;
  r= 255;
  g= 150;
  b= 40;
  dx= 2;
}

//draw
void draw(){ 
  x += dx;
  background(255);
  fill(r,g,b);
  noStroke();
  ellipse(x,y,t,t);
  
  if(x>500-t/2){
    dx *= -1;
  }
}
