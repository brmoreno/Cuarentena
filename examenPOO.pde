class Particula{          
   float px;      
   float py;      
   float t;
   color c;
      
   Particula(float px_, float py_, float t_, color c_){      
      px = px_;      
      py= py_;        
      t = t_;
      c = c_;
   } 
   
   Particula(){
     px = random(width);      
     py= random(height);      
     t = random(5,20);
     c = color(random(255),random(255),random(255));
   }
      
   void display(){      
      noStroke();      
      fill(c);      
      ellipse(px,py,t,t);      
   } 
   
   void funcion(){
     display();
   }
}      
      
class ParticulaMovilA extends Particula{      
      
   float dx;      
   float dy;      
      
   ParticulaMovilA(float px_, float py_, float t_, color c_ ,float dx_, float dy_){      
      super(px_, py_,t_, c_);      
      dx = dx_;      
      dy = dy_;      
   }
   
   ParticulaMovilA(){
     super();
     dx= random(-1,1);
     dy= random(-1,1);
   }
      
   void mover(){      
      px += dx;      
      py += dy;   
   } 
   
   void limite(){
     if(px<0 || px>width){
       dx*= -1;
     }
     if(py<0 || py>height){
       dy*= -1;
     }
   }
   
   void funcion(){
     super.funcion();
     mover();
     limite();
   }
}

class ParticulaMovilB extends ParticulaMovilA{      
      
   float dx;      
   float dy;      
      
   ParticulaMovilB(float px_, float py_, float t_, color c_ ,float dx_, float dy_){      
      super(px_, py_,t_, c_,dx_,dy_);          
   } 
   
   ParticulaMovilB(){
     super();
   }
       
   void limite(){
     if(px<0 ){
       px = width;
     }
     if(px>width){
       px = 0;
     }
     if(py<0 ){
       px = height;
     }
     if(py>height){
       py = 0;
     }
   }
}
      
Particula uno;      
ParticulaMovilA dos; 
ParticulaMovilB tres;
ArrayList <Particula> particulas;
void setup(){      
   size(400,400);      
   uno = new Particula(width/2,height/2,20,color(0));      
   dos = new ParticulaMovilA(width/2,height/2,20,color(255,0,0),1,0);
   tres = new ParticulaMovilB(width/2,height/2,20,color(0,255,0),0,1);
   particulas = new ArrayList <Particula>();
   for(int i = 0; i<50; i++){
     if(i%3 == 0){
       particulas.add(new ParticulaMovilB());
     }
      if(i%2 == 1){
       particulas.add(new ParticulaMovilA());
     }
   }
   println(uno);
   println(dos.px);
   println(tres.c);
}      
      
void draw(){      
   background(255);          
   uno.funcion();
   dos.funcion();
   tres.funcion();
   
   for(Particula p:particulas){
     p.funcion();
   }
}
