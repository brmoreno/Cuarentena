Enemigo uno;
void setup(){
  size(500,500);
  elAvatar = new Avatar(1);
  uno = new Enemigo();
}

void draw(){
  background(255);
  elAvatar.display();
  elAvatar.mover();
  elAvatar.colision(uno);
  uno.display();
}

class Avatar{
  
  float d;
  float x,y;
  color c;
  float v;
  float a;
  
  Avatar(float v_){
    d = 60;
    x = width/2;
    y = height/2;
    c = color(255,0,0);
    v = v_;
    a = 0;
  }
  
  void mover(){
    //el objeto de mueve hacia adelante
    float dx = cos(a)*v;
    float dy = sin(a)*v;
    x+= dx;
    y+= dy;
    // el objeto modifica su dirección con a y s
    if(keyPressed){
      if(key == 'a'){
        a-=0.1;
      }
      if(key == 's'){
        a+=0.1;
      }
    }
  }
  
  boolean colision(Enemigo e_){
    boolean resultado = false;
    float distancia = dist(this.x,this.y,e_.x,e_.y);
    float sumaDeRadios = (this.d/2) + (e_.d/2);
    if(distancia<sumaDeRadios){
      // se que hay una colisión
      println("colision");
      resultado = true;
    }
    return (resultado);
    // el Avatar colisiona con un enemigo
  }
  
  void captura(){
    //el objeto captura un Item
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(x,y,d,d);
  }  
}

class Enemigo{
  float x,y;
  float d;
  
  Enemigo(){
    x = 100;
    y = 100;
    d = 100;
  }
  
  void display(){
    noStroke();
    fill(0,0,255);
    ellipse(x,y,d,d);
  }
  
}

class Item{
  
}
