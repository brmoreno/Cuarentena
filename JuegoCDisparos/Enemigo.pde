interface Enemigo{
  void display();
  void mover();
  PVector posicion();
  float tam();
  boolean impacto(Bala b);
}
