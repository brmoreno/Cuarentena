class Item{
  float x, y, r;
  
  Item(float x_, float y_){
    x = x_;
    y = y_;
    r = 10;
  }
  void display(){
    noStroke();
    fill(255,200,0);
    ellipse(x,y,r*2,r*2);
  }
}
