color fondo = color(random(255),random(255),random(255));
color r1 = color(random(255),random(255),random(255));
color r2 = color(random(255),random(255),random(255));
int x = round(random(500));
int y = round(random(500));

size(500,500);
background(fondo);
fill(r1);
rect(x,y,-100,-100);
fill(r2);
rect(x,y,100,100);
