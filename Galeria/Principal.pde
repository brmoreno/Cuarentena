class Ppal{
  int pantalla; // pantalla =  0,ppal, ;  1= obra1...
  ArrayList <Boton> bmp;
  ArrayList <Boton> bmn;
  Obra primera;
  Obra segunda;
  
  Ppal(){
    bmp = new ArrayList <Boton> ();
    bmn = new ArrayList <Boton>();
    pantalla = 0;   
    for(int i = 0; i<5; i++){
      bmp.add(new Boton(100,20+i*80,300,60));
    }
    
    for( int i = 0; i<3; i++){
      bmn.add(new Boton(100+i*100,400,80,80));
    }
    
    primera = new MapaBits("0148.png");
    segunda = new Texto();
  }
  
  void dibujarMenu(){
    if(pantalla > 0){
      for(Boton b:bmn){
        b.display();
      }
    }
  } 
  
  void display(){
    
    switch(pantalla){
      case 0 :
      for(Boton b:bmp){
        b.display();
      }
      break;
      case 1:
        primera.display();
      
      break;
      case 2:
      fill(0);
        segunda.display();
      
      break;
      case 3:
      fill(255,0,0);
        rect(100,100,300,300);
      
      break;
      case 4:
      
      fill(0,255,0);
        rect(100,100,300,300);
      break;
      case 5:
        fill(0,0,255);
        rect(100,100,300,300);
      
      break;
    }
    dibujarMenu();
  }
  
  void enMousePressed(){
    if(pantalla == 0){
      for(int i = 0; i<bmp.size();i++){
        if(bmp.get(i).over()){
          pantalla = i+1;
        }
      }
    }
    else{
    if(bmn.get(0).over()){
      pantalla--; 
    }
    if(bmn.get(1).over()){
      pantalla = 0; 
    }
    if(bmn.get(2).over()){
      pantalla++;
      if(pantalla >5){
        pantalla = 0;
      }
      
    }
    }
  }
}
