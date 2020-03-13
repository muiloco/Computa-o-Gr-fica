/*Aluno: Fernando Rodrigues de Sousa


Projeto: Desenhar um cubo magico, colorido e com todos os lados;
Nota de Versao 1.0: Desenho do cubo feito com animacao para girar o cubo
em todas as direcoes.
Nota da Versão 1.1: Foi adicionado a função de zoom ao clicar os botões do
mouse, sendo o LEFT para aumentar e o RIGHT para diminuir o tamanho do cubo. 
*/

int v=3;
int w=3;
int cores=6;
int l;
int m;
int n;
float sz = 240/v;
float sze= sz*0.95;
float zoom = 1;
final static float inc = .05;

int [][][]bloco = new int [v][w][cores];
void setup(){
  size(600,600,P3D);
  strokeWeight(3);
  noFill();
  rectMode(CENTER);
  for(int l=0; l<v; l++){
    for(int m=0; m<w; m++){
    for(int n=0; n<cores; n++){
    bloco[l][m][n]=n;
    }
    }
    }
}
void draw(){
  background(100);
  if(mousePressed){
      if (mouseButton == LEFT) {
        zoom += inc;
      } else if (mouseButton == RIGHT) {
        zoom -= inc;
      }
  }
  stroke(0);
  fill(255);
  translate(width/2,height/2);
  rotateX(-mouseY*PI/300);
  rotateY(-mouseX*PI/300);
  scale(zoom);
  box(239);
  for(int l=0; l<v; l++){
  for(int m=0; m<w; m++){
  for(int n=0; n<cores; n++){
    if (n==0){
      pushMatrix();
      translate(v*sz/2,0,0);
      rotateY(PI/2);
      rect(sz*(l-v/2.0+.5),sz*(m-w/2.0+.5),sze,sze);
      popMatrix();
    }
    if (n==1){
      pushMatrix();
      translate(-v*sz/2,0,0);
      rotateY(PI/2);
      rect(sz*(l-v/2.0+0.5),sz*(m-w/2.0+.5),sze,sze);
      popMatrix();
    }
    if (n==2){
      pushMatrix();
      translate(0,w*sz/2,0);
      rotateX(PI/2);
      rect(sz*(l-v/2.0+0.5),sz*(m-w/2.0+0.5),sze,sze);
      popMatrix();
    }
    if (n==3){
      pushMatrix();
      translate(0,-w*sz/2,0);
      rotateX(PI/2);
      rect(sz*(l-v/2.0+0.5),sz*(m-w/2.0+0.5),sze,sze);
      popMatrix();
    }
    if (n==4){
      pushMatrix();
      translate(0,0,w*sz/2);
      rect(sz*(l-v/2.0+0.5),sz*(m-w/2.0+0.5),sze,sze);
      popMatrix();
    }
    if (n==5){
      pushMatrix();
      translate(0,0,-w*sz/2);
      rect(sz*(l-v/2.0+0.5),sz*(m-w/2.0+0.5),sze,sze);
      popMatrix();
    }
  }
  }
  }
}
