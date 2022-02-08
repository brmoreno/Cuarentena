float [] x = new float[50];
float [] y = new float [50];
float t [] = new float [50];
int n[] = new int[50];
float dx[] = new float[50];
float dy[] = new float[50];

void setup(){
  size(500,500);
  for(int i = 0; i<50; i++){
    x [i]= random(width);
    y [i] = random(height);
    t [i] = random(30,100);
    n [i] = round(random(3,12));
    dx[i] = random(2);
    dy[i]= random(2);
  }
}

void draw(){
  background(255);
  for(int i = 0; i<50; i++){
    if( i%2 == 0){
      particula2(x[i],y[i],t[i],n[i]);
    }
    else{
      particula(x[i],y[i],t[i],n[i]);
    }
  }
  //if (keyPressed){
  //  switch(key){
  //    case 'w':
  //      for(int i = 0; i<50; i++){
  //        y[i]-=dy[i];
  //      }
  //    break;
  //    case 'a':
  //    for(int i = 0; i<50; i++){
  //        x[i]-=dx[i];
  //      }
      
  //    break;
  //    case 's':
  //      for(int i = 0; i<50; i++){
  //        y[i]+=dy[i];
  //      }
  //    break;
  //    case 'd':
  //    for(int i = 0; i<50; i++){
  //        x[i]+=dx[i];
  //      }
  //    break;
  //  }
  //}
  
  //if(mousePressed){
  //  for(int i = 0; i<50; i++){
  //     t[i]+=1;
  //  }
  //}  
}

void mousePressed(){
  for(int i = 0; i<50; i++){
          t[i]+=1;
  }
}



void keyPressed(){
  switch(key){
      case 'w':
        for(int i = 0; i<50; i++){
          y[i]-=dy[i];
        }
      break;
      case 'a':
      for(int i = 0; i<50; i++){
          x[i]-=dx[i];
        }
      
      break;
      case 's':
        for(int i = 0; i<50; i++){
          y[i]+=dy[i];
        }
      break;
      case 'd':
      for(int i = 0; i<50; i++){
          x[i]+=dx[i];
        }
      break;
    }
}




void particula(float x_, float y_, float t_, int n_){
  for(int i = n_; i>0; i--){
    ellipse(x_,y_,t_*i/n_,t_*i/n_);
  }
}

void particula2(float x_, float y_, float t_, int n_){
  for(int i = 0; i<n_; i++){
    for(int j = 0; j<n_; j++){
      rect(x_+t_*i/n_,y_+t_*j/n_,t_/n_,t_/n_);
    }
  }
}
