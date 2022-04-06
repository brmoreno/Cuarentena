class EnemigoUno implements Enemigo{
  float x; 
  float y;
  float t;
  float dx;
  float dy;
  
    
  EnemigoUno(float x_, float y_ , float t_){
    x = x_;
    y = y_;
    t = t_;
    float dir = random(TWO_PI);
    dx = cos(dir);
    dy = sin(dir);
  }
  
  void display(){
    fill(0,0,255);
    ellipse(x,y,t,t);
  }
  
  void mover(){
    x+= dx;
    y+= dy;
    if(x<t/2){
    dx = abs(dx);
    }
    if(x>width-t/2){
      dx = -abs(dx);
    }
    if(y<t/2){
      dy = abs(dy);
    }
    if(y>height-t/2){
      dy = -abs(dy);
    }
  }
  
  PVector posicion(){
    PVector pos = new PVector(x,y);
    return pos;
  }
  float tam(){
    float tam = t/2;
    return tam;
  }
  
  boolean impacto( Bala b){
    boolean impacto = false;      
    float distancia = dist(b.pos.x,b.pos.y,this.x,this.y);
    if (distancia < 5 +this.t/2){
      impacto = true;
    }
    return(impacto);
  }
}
