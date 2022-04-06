
Avatar elAvatar;
ArrayList <Enemigo> losEnemigos;
ArrayList <Bala> lasBalas;

float tActual;
float tAnterior;

void setup(){
  size(600,600);
  elAvatar = new Avatar(2);
  losEnemigos = new ArrayList <Enemigo>();
  losEnemigos.add(new EnemigoUno(200,200,100));
  losEnemigos.add(new EnemigoDos(400,400,80));
  lasBalas = new ArrayList<Bala>();
}

void draw(){
  
  if(tActual > tAnterior +3000){
    losEnemigos.add(new EnemigoUno(random(width),random(height),80));
    tAnterior = tActual;
  }
  tActual = millis();
  background(255);
  elAvatar.display();
  elAvatar.mover();
  for(Enemigo e:losEnemigos){
    e.display();
    e.mover();
    if(elAvatar.colision(e)){
      println("COLISION");
    }
    else{
      println( " ");
    }
  }
  
  for(int i = losEnemigos.size()-1; i>= 0; i--){
    for(Bala b:lasBalas){
      if(losEnemigos.get(i).impacto(b)){
        losEnemigos.remove(i);
        break;
      }
    }
  }
  
  for(Bala b:lasBalas){
    b.display();
    b.mover();
  }
}

void keyPressed(){
  if(key == 's'){
    lasBalas.add(new Bala(new PVector(elAvatar.x,elAvatar.y),PVector.fromAngle(elAvatar.direccion)));
  }
}
