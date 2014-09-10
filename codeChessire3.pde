int numFrames =  31;
int numFrames2 =  14;
int currentFrame = 0;
int currentFrame2 = 0;
PShape[] cuerpo = new PShape[24];
PShape[] cola = new PShape[31];
PShape[] ojo = new PShape[14];
PImage fore;
PImage fondo;
boolean quieto;
int q = 0;


final static int NUM = 29, POS = NUM - 1;
final int[] x = new int[NUM], y = new int[NUM];

void setup() {
  int q = 0;
  frameRate(24);
  size(720, 720);
  noCursor();
  fore = loadImage("foreGround.png");
  for ( int i = NUM; i-- != 0; x[i] = mouseX, y[i] = mouseY );

  for (int c = 0; c <24; c++) {
    String imageName = "cat3/" + nf(c, 2) + ".svg";
    cuerpo[c] =  loadShape(imageName);
  }

  for (int t = 0; t <31; t++) {
    String tailName = "tail/" + nf(t, 2) + ".svg";
    cola[t] =  loadShape(tailName);
  }
  
  for (int o = 0; o <14; o++) {
    String ojoName = "ojo/" + nf(o, 2) + ".svg";
    ojo[o] =  loadShape(ojoName);
  }



  fondo = loadImage("backgroundChessire.png");
  
  quieto = true;
}

void draw() {
  background(fondo);

  for ( int i = 0; i != POS; x[i] = x[i + 1], y[i] = y[++i] );

  x[POS] = mouseX-83;
  y[POS] = mouseY-65;

  for (int c = 0; c <24; c++) {
    shape(cuerpo[c], x[c], y[c]);
  }
currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
int offset = 0;
shape(cola[(currentFrame+offset) % numFrames], x[1]-43, y[1]+131);
    
currentFrame2 = (currentFrame2+1) % numFrames2;  // Use % to cycle through frames
int offset2 = 0;


if(quieto){
shape(ojo[1], x[23]+56, y[23]+47);
shape(ojo[1], x[23]+116, y[23]+47);
q++;
    
  if(q >= 100){
    q = 0;
    quieto=false;
  }
}else if(!quieto){
shape(ojo[(currentFrame2+offset2) % numFrames2],  x[23]+56, y[23]+47);
shape(ojo[(currentFrame2+offset2) % numFrames2],  x[23]+116, y[23]+47);
q++;
   
  if(q >= 13){
    q = 0;
    quieto=true;
  }
}
  
image(fore, 0, 0);
 
}
//debería ser una clase que lo haga todo, y que lo único por reemplazar sea la imagen y la posición del ease.

