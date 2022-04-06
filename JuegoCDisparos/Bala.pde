class Bala{
 PVector pos;
 PVector dir;
 float v;
 
 Bala(PVector pos_, PVector dir_){
   pos = pos_;
   dir = dir_;
   v = 5;
 }
 
 void display(){
   noStroke();
   fill(255,0,0);
   ellipse(pos.x,pos.y,10,10);
 }
 
 void mover(){
   pos.add(dir.copy().mult(v));
 }
 
}
