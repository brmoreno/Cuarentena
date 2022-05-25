ArrayList <Cubo> losCubos; 
float d;
void setup(){
  size(500,500,P3D);
  losCubos = new ArrayList <Cubo>();
  for(int i = 0; i<width; i+=20){
    for(int j = 0; j<height; j+= 20){
      losCubos.add(new Cubo(20, new PVector(i,j,0),color(random(255),random(0,120),70)));
    }
  }
}

void draw(){
  d+= 0.01;
  background(0);
  lights();
  translate(width/2,height/2);
  pushMatrix();
  rotateX(mouseX*0.01);
  rotateY(mouseY*0.01);
  translate(-width/2,-height/2);
   
  for(Cubo c:losCubos){
    c.display();
  }
   popMatrix();   
}

class Cubo{
  int t;
  PVector pos;
  color c;
  float rx,ry,rz;
  float drx,dry,drz;
  
  Cubo(int t_, PVector pos_, color c_ ){
    t = t_;
    pos = pos_;
    c = c_;
    //rx = random(TWO_PI);
    //ry = random(TWO_PI);
    //rz = random(TWO_PI);
    drx = random(-0.01,0.01);
    dry = random(-0.01,0.01);
    drz = random(-0.01,0.01);
  }
  
  void display(){
    pushMatrix();
    
    pos.z =noise(pos.x*0.01,pos.y*0.01,d)*300;
    
    translate(pos.x,pos.y,pos.z);
    rotateX(rx);
    rotateY(ry);
    //rotateZ(rz);
    noStroke();
    fill(c);
    box(t);
    popMatrix();
  }
}
