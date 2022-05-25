class Texto implements Obra{
  
  String s;
  
  Texto(){
    s = "foo,bar ,bZ ,QUX";
  }
  
  void display(){
    fill(0);
    text(s,100,100);
  }
  
}
