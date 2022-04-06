class Avatar{
  float x,y,r;
  float direccion;
  float velocidad;
  
  Avatar(float v_){
    x= width/2;
    y = height/2;
    direccion = - HALF_PI;
    velocidad = v_;
    r = 30;
  }
  
  void display(){
    noStroke();
    fill(255,0,0);
    ellipse(x,y,r*2,r*2);
  }
  
  void mover(){
    x+= cos(direccion)*velocidad;
    y+= sin(direccion)*velocidad;
    if (keyPressed){
      if (key == 'd'){
        direccion+= 0.05;
      }
      if (key == 'a'){
        direccion-= 0.05;
      }
    }
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  boolean colision(Enemigo e){
    boolean resultado = false;
    float distancia = dist(e.posicion().x,e.posicion().y,this.x,this.y);
    if (distancia < e.tam() +this.r){
      resultado = true;
    }
    return resultado;
  }
  
  boolean captura(Item i){
    boolean resultado = false;
    float distancia = dist(i.x,i.y,this.x,this.y);
    if (distancia < this.r + i.r){
      resultado = true;
    }
    return resultado;
  }
}
