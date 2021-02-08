float x = 0.01;
float y = 0;
float z = 0;
float a = 10;
float b = 28;
float c = 2.5;

ArrayList<PVector> posiciones = new ArrayList<PVector>();

void setup() {
  size(400, 400,P3D);

}

void draw() {
  background(0);
  float dt = 0.01;
  float dx = (a * (y - x))*dt;
  float dy = (x * (b - z) - y)*dt;
  float dz = (x * y - c * z)*dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;

  posiciones.add(new PVector(x, y, z).mult(3));

  translate(width/2, height/2);
  //rotateY(mouseX*0.1);
  //rotateX(mouseY*0.1);
  stroke(255);
  noFill();
  
  beginShape();
  for (PVector v : posiciones) {
    vertex(v.x, v.y,v.z);
  }
  endShape();
}
