class Boton{
  int x,y;
  int w,h;
  boolean presionando;
  boolean over;
  
  Boton(int x_, int y_, int w_, int h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    presionando = false;
    over = false;
  }
  
  void display(){
    fill(255,0,0);
    rect(x,y,w,h);
    over = over(); 
  }
  
  boolean over(){
    boolean valor = false;
    if(mouseX>x && mouseX<x+w && mouseY>y && mouseY <y+h){
      valor = true;
    }
    return valor;
  }  
}
