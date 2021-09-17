class Epi{
  float x,y;
  float r;
  float a;
  float xf,yf;
  Epi e;
  float da;
  color c;
  
  Epi(float x_, float y_){
    x = x_;
    y = y_;
    r = random(30,100);
    a = random(30,100);
    update();
    da = random(-0.05,0.05);
    c = color(random(255),random(255),random(255));
  }
  
  Epi(Epi e_){
    e= e_;
    x =e.xf;
    y = e.yf;
    r = random(30,100);
    a = random(30,100);
    update();
    da = random(-0.05,0.05);
    c = color(random(255),random(255),random(255));
  }
   
  void update(){
    a += da;
    if(e != null){
      x =e.xf;
      y = e.yf;
    }
    xf = x+cos(a)*r;
    yf = y+sin(a)*r;
  }
  
  
  void display(){
    noStroke();
    fill(c,50);
    //ellipse(x,y,5,5);
    //ellipse(xf,yf,5,5);
    
    noFill();
    stroke(c,40);
    strokeWeight(4);
    //ellipse(x,y,r*2,r*2);
    line(x,y,xf,yf);
    //line(x,y,xf,y);
    //line(xf,y,xf,yf);
  }
}

Epi elEpi;
Epi otroEpi;
Epi otroMas;
Epi unoMas;
Epi ultimo;


void setup(){
  size(500,500);
  elEpi = new Epi(0,height/2);
  otroEpi = new Epi(elEpi);
  otroMas = new Epi(otroEpi);
  unoMas = new Epi(otroMas);
  ultimo = new Epi(unoMas);
  background(255);
}

void draw(){ 
  //background(255);
  elEpi.update();
  elEpi.display();
  otroEpi.update();
  otroEpi.display();
  otroMas.update();
  otroMas.display();
  unoMas.update();
  unoMas.display();
  ultimo.update();
  ultimo.display();
  elEpi.x+=0.1;  
}
