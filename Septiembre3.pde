int t = 100;
int r1 [] = new int[6];
int r2 [] = new int[6];
int g1 [] = new int[6];
int g2 [] = new int[6];
int b1 [] = new int[6];
int b2 [] = new int[6];

int maxRan = 100; 
int minRan = -20;

color coloresA[] = new color[6];

void setup(){
  size(800,800);
  background(255);
  stroke(255);
  strokeWeight(5);
  for(int i = 0; i<r1.length; i++){
    r1[i] = ceil(random(minRan,maxRan));
    r2[i] = ceil(random(2,8));
    g1[i] = ceil(random(minRan,maxRan));
    g2[i] = ceil(random(2,8));
    b1[i] = ceil(random(minRan,maxRan));
    b2[i] = ceil(random(2,8));
    coloresA[i] = color(random(255),random(255),random(255));
  }
  
  
  for(int i = 0; i<width; i+= t){
    for(int j  = 0; j< height; j+= t){
      
     // int r = 0;
     // int g = 0;
     // int b = 0;
      
      
     // for(int k = 0; k<r1.length; k++){
     //   if(k%2 == 0){
     //     r += generaColor(r1[k],i/t,r2[k]);
     //   }
     //   else{
     //     r += generaColor(r1[k],j/t,r2[k]);
     //   }
     // }
     
     //for(int k = 0; k<r1.length; k++){
     //   if(k%2 == 0){
     //     g += generaColor(g1[k],i/t,g2[k]);
     //   }
     //   else{
     //     g += generaColor(g1[k],j/t,g2[k]);
     //   }
     // }
      
     // for(int k = 0; k<r1.length; k++){
     //   if(k%2 == 0){
     //     b += generaColor(b1[k],i/t,b2[k]);
     //   }
     //   else{
     //     b += generaColor(b1[k],j/t,b2[k]);
     //   }
     // }
     
     
      int c = floor(random(6));
      fill(coloresA[c]);  
      rect(i,j,t,t);
      
      c = floor(random(6));
      fill(coloresA[c]);
      int v = floor(random(5));
      geometria(i,j,t,v);
    }
  }
  saveFrame(hour()+"-"+minute()+"-"+second()+".jpg");
}
 
int generaColor(int v_, int i_, int mi_){
  int valor  = 0;
  if(i_%mi_ == 0){
     valor = v_;
  } 
  return valor;
}

void geometria(int i_, int j_, int t_, int v_){
  switch(v_){
   case 0:
    rect(i_,j_,t_,t_);
   break;
   case 1:
    triangle(i_,j_,i_+t,j_,i_,j_+t);
   break;
   case 2:
    triangle(i_+t_,j_,i_+t_,j_+t_,i_,j_+t_);
   break;
   case 3:
    triangle(i_,j_,i_+t,j_,i_+t_,j_+t_);
   break;
   case 4:
    triangle(i_,j_,i_,j_+t,i_+t_,j_+t_);
   break;
  }
}
