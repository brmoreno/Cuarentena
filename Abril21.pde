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
      periodo[i] = round(random(15));
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
    float tam;
    
    Particula(){
      px = new FuncionPeriodica(15);
      py = new FuncionPeriodica(15);
      tam = random(10,30);
    }
    
    void display( float v_){
      noStroke();
      ellipse(map(px.valor(v_),-px.ampTotal,px.ampTotal,0,400),map(py.valor(v_),-py.ampTotal,py.ampTotal,0,400),tam,tam);
    }
}

Particula una;
float delta;
ArrayList <Particula> Particulas;

void setup(){
  size(400,400);
  background(0);
  una = new Particula();
  Particulas = new ArrayList<Particula>();
  for (int i = 0 ; i<100; i++){
    Particulas.add(new Particula());
  }
}

void draw(){
  background(0);
  delta += 0.0025;
  for (Particula p:Particulas){
    p.display(delta);
  }
}
