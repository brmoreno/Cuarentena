class EnemigoDos implements Enemigo{
  float x; 
  float y;
  float t;
    
  EnemigoDos(float x_, float y_ , float t_){
    x = x_;
    y = y_;
    t = t_;
  }
  
  void display(){
    fill(0,0,125);
    ellipse(x,y,t,t);
  }
  
  void mover(){
    x+= random(-2,2);
    y+= random(-2,2);
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
