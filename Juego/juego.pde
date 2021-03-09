Avatar elAvatar;
Enemigo uno;

void setup(){
  size(400,400);
  elAvatar = new Avatar();
  uno = new Enemigo(100,100,50,0);
}

void draw(){
  background(255);
  elAvatar.display();
  elAvatar.mover();
  uno.display();
  uno.mover();
  if(elAvatar.colision(uno)){
     println("COLISON"); 
  }
  else{
    println("NO d");
  }
}

class Avatar{
  float x,y; //posición en xy
  float r; // tamaño expresado como el radio; 
  float v; // velocidad;
  float d; // dirección // ángulo; 
  
  Avatar(){
    x = width/2;
    y = height/2;
    r = 30;
    v = 2;
    d = 0; //se mueve a la derecha 
  }
  
  void display(){
    noStroke();
    fill(255,0,0);
    ellipse(x,y,r*2,r*2);
  }
  
  void mover(){
    x+= cos(d)*v;
    y+= sin(d)*v;
    if(keyPressed){
      if(key == 'a'){
        d-= 0.1;
      }
      if(key == 'd'){
        d+= 0.1;
      }
    }
    x = constrain(x,0+r,width-r);
    y = constrain(y,0+r,height-r);   
  }
  
  boolean colision(Enemigo e){
    boolean col = false;
    //si la distancia entre el Avatar y el Enemigo e es menor a la 
    //suma de los radios, existe colisión.
    float distancia = dist(this.x,this.y,e.x,e.y);
    if(this.r+e.r>distancia){
      col = true;
    }
    return col;
  }
  
  void captura(){
  }
}

class Enemigo{
  float x,y; //posición
  float r; // tamaño
  int comp; //comportamiento del objeto: 0 = estatico, 1 = aleatorio
  // 2 = constante
  float dx,dy;
  
  Enemigo(float x_, float y_, float r_, int comp_ ){
    x = x_;
    y = y_;
    r = r_;
    comp = comp_;
  }
  
  void display(){
    noStroke();
    fill(0,0,255);
    ellipse(x,y,r*2,r*2);
  }
  
  void mover(){ 
    switch(comp){
      case 0:
        estatico();
      break;
      case 1:
        aleatorio();
      break;
      case 2:
        constante();
      break;
    }
  }
  
  void estatico(){
  }
  
  void aleatorio(){
  }
  
  void constante(){
  }
  
  
}

class Item{
  float x, y;
  float r;
  
  Item(float x_, float y_){
    x = x_;
    y = y_;
    r = 10;
  }
  
  void display(){
    noStroke();
    fill(255,255,0);
    ellipse(x,y,r*2,r*2);
  }
  
}
