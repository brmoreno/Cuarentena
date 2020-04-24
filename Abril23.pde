class FuncionPeriodica{
  int n;
  int periodo [];
  float amplitud [];
  float f[];
  float ampTotal;
  
  FuncionPeriodica(int n_){
    n = n_; 
    periodo = new int[n_];
    amplitud = new float [n_];
    f = new float[n_];
    for(int i = 0; i< n; i++){
      periodo[i] = round(random(2));
      amplitud[i] = random(2);
      ampTotal+= amplitud[i];
      f[i] = random(PI);
    } 
  }
  
  float valor (float v_){
    float valor = 0;
    for(int i = 0 ; i<n; i++){
      valor += sin((v_+ f[i])*periodo[i] )*amplitud[i];
    }
    return valor;
  }  
}


class Particula{
    FuncionPeriodica px;
    FuncionPeriodica py;
    FuncionPeriodica tam;
    FuncionPeriodica r;
    FuncionPeriodica g;
    FuncionPeriodica b;
    
    
    Particula(){
      px = new FuncionPeriodica(2);
      py = new FuncionPeriodica(2);
      tam = new FuncionPeriodica(2);
      r = new FuncionPeriodica(2);
      g = new FuncionPeriodica(2);
      b = new FuncionPeriodica(2);
    }
    
    void display(float v_){
      noStroke();
      fill(map(r.valor(v_),-r.ampTotal/4,r.ampTotal/4,0,255),map(g.valor(v_),-g.ampTotal/4,g.ampTotal/4,0,255),map(b.valor(v_),-b.ampTotal/4,b.ampTotal/4,0,255));
      ellipse(map(px.valor(v_),-px.ampTotal,px.ampTotal,-200,600),map(py.valor(v_),-py.ampTotal,py.ampTotal,-200,400),tam.valor(v_)*20,tam.valor(v_)*20);
    }
}


float delta;
ArrayList <Particula> Particulas;

void setup(){
  size(400,400);
  background(0);
  Particulas = new ArrayList<Particula>();
  for (int i = 0 ; i<500; i++){
    Particulas.add(new Particula());
  }
}

void draw(){
  background(0);
  delta += 0.05;
  for (Particula p:Particulas){
    p.display(delta);
  }
 
 if(delta<TWO_PI){
   saveFrame();
 }
 else{
   exit();
 }
  
}
