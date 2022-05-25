ArrayList <Cubo> cubos;
float d;
float val;
void setup(){
  size(500,500,P3D);
  cubos = new ArrayList <Cubo>();
  for(int i = 0; i<300; i++){
    cubos.add(new Cubo());
  }
}

void draw(){
  d+=0.05;
  val = map(sin(d),-1,1,50,200);
  background(255);
  lights();
  translate(width/2,height/2);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  for(Cubo c:cubos){
    c.display();
  }
}

class Cubo{
  PVector pos;
  color c;
  float rota1[] = new float [3];
  float drota1[] = new float [3];
  float rota2[] = new float [3];
  float drota2[] = new float [3];
  Cubo(){
    pos = PVector.random3D();
    c = color(random(100,255),random(10,80),random(50,150));
    for(int i = 0; i<3; i++){
      rota1[i] = random(TWO_PI);
      drota1[i] = random(-0.01,0.01);
      rota2[i] = random(TWO_PI);
      drota2[i] = random(-0.02,0.02);
    }
  }
  void display(){
    for(int i = 0; i<3; i++){
      rota1[i] += drota1[i];
      rota2[i] += drota2[i];
    }
    pos.setMag(val);
    pushMatrix();
    rotateX(rota2[0]);
    rotateY(rota2[1]);
    translate(pos.x,pos.y,pos.z);
    noStroke();
    fill(c);
    pushMatrix();
    rotateX(rota1[0]);
    rotateY(rota1[1]);
    rotateZ(rota1[2]);
    box(20);
    popMatrix();
    popMatrix();
  }
}
