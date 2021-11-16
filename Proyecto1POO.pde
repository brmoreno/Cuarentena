interface Particula{
  void display();
  void mover();
  boolean colision(); 
}

class ParticulaCuadrada implements Particula{
  float x,y,w,h;
  color original;
  color col;
  float d = 1;
  ParticulaCuadrada(){
    x = random(width);
    y = random(height);
    w = 20;
    h = 20;
    original = color(255,0,0);
    col = color(0,255,0);
  }
  void display(){
    if(colision()){
      fill(col);
    }
    else{
      fill(original);
    }
    rect(x,y,w,h);
  }
  void mover(){
    y+= d;
    if(y>height-h){
      d= -abs(d);;
    }
    
    if(y<0){
      d = abs(d);
    }
  }
  boolean colision(){
   boolean colisiona = false;
   for(ParticulaRedonda p:pr){
     if((x>p.x&&x<p.x+p.w&&y>p.y&&y<p.y+p.h)||(p.x>x&&p.x<x+w&&p.y>y&&p.y<y+h)){
       colisiona = true;
     }
   }
   return colisiona;
  }
}

class ParticulaRedonda implements Particula{
  
  float x,y,w,h;
  color original;
  color col;
  float d = 1;
  ParticulaRedonda(){
    x = random(width);
    y = random(height);
    w = 20;
    h = 20;
    original = color(0,0,255);
    col = color(0,255,0);
  }
  void display(){
    if(colision()){
      fill(col);
    }
    else{
      fill(original);
    }
    ellipseMode(CORNER);
    ellipse(x,y,w,h);
  }
  void mover(){
    x+= d;
    if(x>width-w){
      d= -abs(d);;
    }
    
    if(x<0){
      d = abs(d);
    }
  }
  boolean colision(){
    boolean colisiona = false;
   for(ParticulaCuadrada p:pc){
     if((x>p.x&&x<p.x+p.w&&y>p.y&&y<p.y+p.h)||(p.x>x&&p.x<x+w&&p.y>y&&p.y<y+h)){
       colisiona = true;
     }
   }
   return colisiona;
  
  }
}
