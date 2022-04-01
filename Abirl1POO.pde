class Particula{
  PVector pos;
  PVector mov;
  float t;
  float rota;
  int contador;
  
  Particula(){
    pos = new PVector(width/2,height/2);
    mov = PVector.random2D();
    t = random(5,10);
    rota = random(-0.1,0.1);
  }
  
  void display(){
    color uno = Iuno.get(round(pos.x),round(pos.y));
    fill(uno);
    noStroke();
    ellipse(pos.x,pos.y,t,t);
  }
  
  void mover(){
    pos.add(mov);
    mov.rotate(rota);
    contador++;
    if(contador>100){
      rota = random(-0.2,0.2);
    }
   
    pos.x = constrain(pos.x,0,width);
    pos.y = constrain(pos.y,0,height);
  }  
}

class ParticulaDos extends Particula{
  float d;
  float dt;
  ParticulaDos(){
    super();
    d = random(TWO_PI);
    dt = random(0.1);
  }
  
  void display(){
    d+=dt;
    float tam = sin(d)*30;
    noFill();
    color uno = Idos.get(round(pos.x),round(pos.y));
    
    stroke(uno);
    ellipse(pos.x,pos.y,tam,tam);
  }
}

class ParticulaTres extends Particula{
  PVector orbita;
  float rotaOrbita;
  
  ParticulaTres(){
    super();
    orbita = PVector.random2D();
    orbita.setMag(20);
    rotaOrbita = random(-0.1,0.1);
  }
  void display(){
    color uno = Itres.get(round(pos.x),round(pos.y));
    
    orbita.rotate(rotaOrbita);
    fill(uno);
    ellipse(pos.x,pos.y,5,5);
    fill(uno);
    PVector posSat = pos.copy().add(orbita);
    ellipse(posSat.x,posSat.y,5,5);
    noFill();
    stroke(uno);
    ellipse(pos.x,pos.y,40,40);
  }
}


ArrayList <Particula> particulas;
PImage Iuno;
PImage Idos;
PImage Itres;


void setup(){
  size(1280,1024);
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<30; i++){
    particulas.add(new Particula());
    particulas.add(new ParticulaDos());
    particulas.add(new ParticulaTres());
  }
  Iuno = loadImage("claudia.png");
  Idos = loadImage("minerva.jpg");
  Itres = loadImage("yohanna.png");
  Iuno.resize(1280,1024);
  Idos.resize(1280,1024);
  Itres.resize(1280,1024);
}


void draw(){
  
  for(Particula p:particulas){
    p.display();
    p.mover();
  }
   
}
