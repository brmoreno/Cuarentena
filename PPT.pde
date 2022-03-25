Juego uno;

void setup(){
  size(300,300);
  uno = new Juego();
}

void draw(){
  background(255);
  fill(0);
  uno.display();
  
}

void keyPressed(){
  uno.teclado();
}

class Juego{
  Partida laPartida;
  int puntosUno;
  int puntosDos;
  int consecutivosUno;
  int consecutivosDos;
  int pantalla; // 0 Inicio, 1 Juego, 2 Resultado;
  int resultado; // 1 gana uno, 2 gana dos;
  
  
  Juego(){
    laPartida = new Partida();
  }
  
  void display(){
    switch(pantalla){
      case 0:
       inicio();
      break;
      case 1:
      laPartida.display();
      text(puntosUno, 50,50);
      text(puntosDos,250,50);
      reglas();
      break;
      case 2:
        resultado();
      break;
    }
  }
  
  void reglas(){
    if (puntosUno == 5 || consecutivosUno == 3){
      pantalla = 2;
      resultado = 1;
    }
    
    if(puntosDos == 5 || consecutivosDos == 3){
      pantalla = 2;
      resultado = 2;
    }
  }
  
  void teclado(){
    laPartida.teclado();
    if(pantalla == 0){
      pantalla = 1;
    }
    if(pantalla == 1 && laPartida.termino){
      if (laPartida.resultado == 1){
        puntosUno++;
        consecutivosUno++;
        consecutivosDos = 0;
        laPartida = new Partida();
      }
      
      if (laPartida.resultado == 2){
        puntosDos++;
        consecutivosDos++;
        consecutivosUno = 0;
        laPartida = new Partida();
      }
      if(laPartida.resultado == 3){
        consecutivosUno = 0;
        consecutivosDos = 0;
        laPartida = new Partida();
      }
    }
    
    if(pantalla == 2){
      laPartida = new Partida();
      puntosUno = 0;
      puntosDos = 0;
      consecutivosUno = 0;
       consecutivosDos = 0;
      pantalla = 0; 
      resultado = 0;
    }
  }
  
  void inicio(){
    text("INICIO", 100, 100);
  }
  
  void resultado(){
    if(resultado == 1){
      text("GANO JUGADOR UNO",100,100);
    }
    if(resultado == 2){
      text("GANO JUGADOR DOS",100,100);
    }
  }
}

class Jugador{
  int x,y;
  int jugada; //1 piedra, 2 papel, 3 tijeras
  boolean yaJugo = false;
  
  Jugador(int x_, int y_){
    x = x_;
    y = y_;
  }
  
  void display(){
    text(jugada,x,y);
  }
}

class Partida{
  Jugador uno;
  Jugador dos;
  boolean termino = false;
  int resultado ; // 1 gana uno, 2 gana dos, 3 empate
  
  Partida (){
    uno = new Jugador(100,100);
    dos = new Jugador(200,100);
  }
  
  void display(){
    uno.display();
    dos.display();
    reglas();
    if(termino){
      switch(resultado){
        case 1:
          text("GANO UNO",100,300);
        break;
        case 2:
          text("GANO Dos",100,300);
        break;
        case 3:
          text("EMPATE",100,300);
        break;
      }
    }
  }
  
  void reglas(){
    if(uno.yaJugo && dos.yaJugo){
      termino = true;
      if (uno.jugada == dos.jugada){
        resultado = 3;
      }
      if(uno.jugada == 2  && dos.jugada == 1){
        resultado = 1;
      }
      if(uno.jugada == 3  && dos.jugada == 1){
        resultado = 2;
      }
      if(uno.jugada == 1  && dos.jugada == 2){
        resultado = 2;
      }
      if(uno.jugada == 3  && dos.jugada == 2){
        resultado = 1;
      }
      if(uno.jugada == 1  && dos.jugada == 3){
        resultado = 1;
      }
      if(uno.jugada == 2  && dos.jugada == 3){
        resultado = 2;
      }
      
    }
  }
  
  
  void teclado(){
    if(!uno.yaJugo){
      switch(key){
        case 'a':
          uno.jugada = 1;
          uno.yaJugo = true;
        break;
        case 's':
          uno.jugada = 2;
          uno.yaJugo = true;
        break;
        case 'd':
          uno.jugada = 3;
          uno.yaJugo = true;
        break;
      }
    }
    
    if(!dos.yaJugo){
      switch(key){
        case 'j':
          dos.jugada = 1;
          dos.yaJugo = true;
        break;
        case 'k':
          dos.jugada = 2;
          dos.yaJugo = true;
        break;
        case 'l':
          dos.jugada = 3;
          dos.yaJugo = true;
        break;
      }
    }
  }
  
}
