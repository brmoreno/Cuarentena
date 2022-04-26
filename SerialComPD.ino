
void setup() {
  Serial.begin(9600);
}

void loop() {
  int val = map(analogRead(A0),0,1023,0,127);
  Serial.write(val);
  Serial.write(128);
  val = map(analogRead(A1),0,1023,0,127);
  Serial.write(val);
  Serial.write(129); 
}
