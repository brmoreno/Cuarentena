// principal : mostrar el contenido según el estado del programa: menú ppal o mostrar una obras
// boton: botón abstracto ;
// Pantalla/ obra -> interface 
Ppal ppal;

void setup(){
  size(500,500);
  ppal = new Ppal();
  
}

void draw(){
  background(255);
  ppal.display();
}

void mousePressed(){
  ppal.enMousePressed();
}
