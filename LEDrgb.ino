//Variables Globales
int pinLedR = 9;
int pinLedG = 10;
int pinLedB = 11;
int potR = A0;
int potG = A1;
int potB = A2;
int luzR;
int luzG;
int luzB;

void setup() {
  
}

void loop() {
  luzR = analogRead(potR)/4;
  analogWrite(pinLedR,luzR);
  luzG = analogRead(potG)/4;
  analogWrite(pinLedG,luzG);
  luzB = analogRead(potB)/4;
  analogWrite(pinLedB,luzB);
  
}
