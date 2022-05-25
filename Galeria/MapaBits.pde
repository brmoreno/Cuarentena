class MapaBits implements Obra{
  PImage imagen;
  MapaBits (String s){
    imagen = loadImage(s);
  }
  
  void display(){
    image(imagen,0,0);
  }
}
