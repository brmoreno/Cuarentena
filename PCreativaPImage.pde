class Particula{
  float x,y;
  float t;
  float r;
  float dr;
  float dy,dx;
  float ro,ve,az;
  
  Particula(){
    x = random(width);
    y = random(height);
    t = random(10,100);
    r = random(TWO_PI);
    dr = random(-0.1,0.1);
    dy = random(-2,2);
    dx = random(-2,2);
    ro = random(50);
    ve = random(50);
    az = random(50);
  }
  
  Particula(int x_, int y_, int t_, float r_){
    x = x_;
    y = y_;
    t = t_;
    r = r_;
    dr = random(-0.1,0.1);
    dy = random(-2,2);
    dx = random(-2,2);
    ro = random(50);
    ve = random(50);
    az = random(50);
  }
  
  void mover(){
    x+=dx;
    y+=dy;
    
    if(x<-t){
      x=width;
    }    
    if(x>width+t){
      x=0;
    }
    
    if(y<-t){
      y=height ;
    }    
    if(y>height+t){
      y=0;
    }
  }
  
  void display(){
    r += this.dr;
    float rojo = 0;
    float azul = 0;
    float verde = 0;
    for(int i = round(x) - round(t/2); i< round(x)+t/2; i++){
      for(int j = round(y) - round(t/2); j<round(y)+t/2; j++){
          color c = imagen.get(i,j);
          rojo += red(c);
          verde += green(c);
          azul += blue(c);
        }
      }
      color Final = color(rojo/(t*t)+ro,verde/(t*t)+ve,azul/(t*t)+az);
      fill(Final);      
      noStroke();
      rectMode(CENTER);
      pushMatrix();
      translate(x,y);
      rotate(r);
      rect(0,0,t,t);  
      popMatrix();
  }
}

PImage imagen;
ArrayList<Particula> particulas;
void setup(){
   size(450,450);
   imagen = loadImage("gatocubrebocas.png");
   particulas = new ArrayList <Particula>();
   for(int i = 15; i<width; i+= 20){
     for(int j = 15; j<height; j+= 20){
       particulas.add(new Particula());
     }
   }
}


void draw(){
  background(255);
  for(Particula p:particulas){
    p.display();
    p.mover();
  }
}
