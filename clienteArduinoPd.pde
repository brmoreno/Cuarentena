//Processing 3

import processing.serial.*;
import cc.arduino.*;
import oscP5.*;
import netP5.*;


Arduino arduino;
OscP5 oscP5;
NetAddress myRemoteLocation;

boolean inputD[];
boolean outputD[];
boolean inputA[];
boolean outputA[];
boolean servo[];

void setup(){
  inputD = new boolean[14];
  outputD = new boolean[14];
  inputA = new boolean[6];
  outputA = new boolean[14];
  servo = new boolean[14];  
  println(Arduino.list());
  
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12001);  
}

void draw(){
  for(int i=0; i<=13; i++){
    if(inputD[i]){
      OscMessage myMessage = new OscMessage("/inputD");
      myMessage.add("/"+i);
      myMessage.add(arduino.digitalRead(i));
      oscP5.send(myMessage, myRemoteLocation);
    }
  }
  
  for(int i=0; i<=5; i++){
    if(inputA[i]){
      OscMessage myMessage = new OscMessage("/inputA");
      myMessage.add("/"+i);
      myMessage.add(arduino.analogRead(i));
      oscP5.send(myMessage, myRemoteLocation);
    }
  }
}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  if(theOscMessage.checkAddrPattern("/setInputD")==true){
    int val = theOscMessage.get(0).intValue();
    if (val>=0 && val<=13){
      inputD[val] = true;
      outputD[val] = false;
      outputA[val] = false;
      servo[val] = false;
      arduino.pinMode(val, Arduino.INPUT);
    }
  }
  
  if(theOscMessage.checkAddrPattern("/setOutputD")==true){   
    int val = theOscMessage.get(0).intValue();
    if (val>=0 && val<=13){
      inputD[val] = false;
      outputD[val] = true;
      outputA[val] = false;
      servo[val] = false;
      arduino.pinMode(val, Arduino.OUTPUT);
    }
  }
  
  if(theOscMessage.checkAddrPattern("/setInputA_start")==true){
    int val = theOscMessage.get(0).intValue();
    if (val>=0 && val<=5 ){
      inputA [val] = true;
    }
  }
  
  if(theOscMessage.checkAddrPattern("/setInputA_stop")==true){
    int val = theOscMessage.get(0).intValue();
    if (val>=0 && val<=5 ){
      inputA [val] = false;
    }
  }
  
  if(theOscMessage.checkAddrPattern("/setOutputA")==true){
    int val = theOscMessage.get(0).intValue();
    if (val>=0 && val<=13){
      inputD[val] = false;
      outputD[val] = false;
      outputA[val] = true;
      servo[val] = false;
      arduino.pinMode(val, Arduino.OUTPUT); //revisa si funciona así
    }
  }
  
  if(theOscMessage.checkAddrPattern("/setServo")==true){
    int val = theOscMessage.get(0).intValue();
    if (val>=0 && val<=13){
      inputD[val] = false;
      outputD[val] = false;
      outputA[val] = false;
      servo[val] = true;
      arduino.pinMode(val, Arduino.SERVO); //revisa si funciona así
    }
  }
  
  if(theOscMessage.checkAddrPattern("/digitalWrite")==true){
    int pin = theOscMessage.get(0).intValue();
    int val = theOscMessage.get(1).intValue();
    if (pin>=0 && pin<=13){
      if (outputD[pin]){
        if (val == 0){
          arduino.digitalWrite(pin, Arduino.LOW);
        }
        if (val == 1){
          arduino.digitalWrite(pin, Arduino.HIGH);
        }        
      }
    }
  }
  
  if(theOscMessage.checkAddrPattern("/analogWrite")==true){
    int pin = theOscMessage.get(0).intValue();
    int val = theOscMessage.get(1).intValue();
    if (pin>=0 && pin<=13){
      if (outputA[pin]){
        if(val>=0 && val<=255){
          arduino.analogWrite(pin,val); 
        }
      }
    }
  }  
  
  if(theOscMessage.checkAddrPattern("/servoWrite")==true){
    int pin = theOscMessage.get(0).intValue();
    int val = theOscMessage.get(1).intValue();
    if (pin>=0 && pin<=13){
      if (servo[pin]){
        if(val>=0 && val<=180){
          arduino.servoWrite(pin,val); 
        }
      }
    }
  }
  
  if(theOscMessage.checkAddrPattern("/list")==true){   
    String[] list = Arduino.list();
    for(int i = 0; i<list.length;i++){
      OscMessage myMessage = new OscMessage("/list");
      myMessage.add(i + " - " + list[i]);
      oscP5.send(myMessage, myRemoteLocation);
    }    
  }
  
  if (theOscMessage.checkAddrPattern("/set")==true){
    int val = theOscMessage.get(0).intValue();
    String[] list = Arduino.list();
    if (val < list.length){
      arduino = new Arduino(this, Arduino.list()[val], 57600);
    }
  }
}
