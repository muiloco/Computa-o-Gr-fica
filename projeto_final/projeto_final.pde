// classe do corpo
 class Corpo  {
     float posx, posy;
     color cor;
    Corpo (float x, float y, color c) {
        posx = x;
        posy = y;
        cor = c;
    }
    void draw(){
        fill(cor);
        box(150);
    }

}

// classe de olhos
 class Olhos  {
    float posx, posy;
    color cor;
    Olhos (float x, float y, color c) {
        posx = x;
        posy = y;
        cor = c;
    }
    void draw_olhos(){
        pushMatrix();
        //Olhos
        translate(posx, posy, 76);
        fill(cor);
        ellipse(posx-30, posy+30, 30, 60);
        ellipse(posx+30, posy+30, 30, 60);
        popMatrix();
    }
    void draw_iris(float var1){                                  //incrementos para posicao das iris
        pushMatrix();
        //Iris
        translate(posx, posy, 77.5);
        fill(0);
        ellipse(posx-30, posy+var1, 15, 15);
        ellipse(posx+30, posy+var1, 15, 15);
        popMatrix();
    }

}

// classe da boca
 class Boca  {
    float posx, posy;
    color cor;
     Boca (float x, float y, color c) {
        posx = x;
        posy = y;
        cor = c;
    }
    void draw(boolean var2){                                    //Flag de escolha do formato da boca
        pushMatrix();
        translate(posx, posy, 76);
        noFill();
        if (var2 == false) {
            arc(posx, posy-30, 100, 75, PI, (2*PI), OPEN);
        } else if (var2 == true) {
            arc(posx, posy-50, 100, 75, 0, PI, OPEN);
        }
        popMatrix();
    }

}

// classe Geral
 class Emoji  {
    float posx, posy;
    Emoji (float x, float y) {
        posx = x;
        posy = y;
    }
    void draw(float var1, boolean var2){
        Corpo corpo = new Corpo(posx, posy,color(123, 104, 238));
        Olhos olho = new Olhos(posx, posy, 255);
        Boca boca = new Boca(posx, posy, 255);
        corpo.draw();
        olho.draw_olhos();
        olho.draw_iris(var1);
        boca.draw(var2);
    }

}

boolean decision = false;                               //flag de define qual das duas animacoes sera desenhada

void setup(){
  size(512, 512,P3D);
  strokeWeight(4);                                      //Lagura dos tracos
  smooth(16);                                           // Filtro anti-alising
}

//Funcao de para desenhar a animacao
void drawAnimation(float var, boolean flag, Emoji emoji){
  translate(width/2, height/2);
  rotateX(-mouseY*PI/256);
  rotateY(-mouseX*PI/256);
  emoji.draw(var, flag);
}

void draw(){
  background(255);
  //Escolha de Animacao
  if(mousePressed){
      if (mouseButton == LEFT) {
        decision = true;
      } else if (mouseButton == RIGHT) {
        decision = false;
      }
  }
  pointLight(255, 255, 255, 256, 256, 200);                  //similar a posicao de um laterna apontada
  //directionalLight(255, 255, 255,0,0,-1);                   //direcao da luz ambiente, vido de frente
  Emoji emoji = new Emoji(0, 0);
  pushMatrix();
  //Desenha a animacao de acordo com a escolha
  if (decision == false) {
      drawAnimation(30, decision, emoji);
  } else if (decision == true) {
      drawAnimation(15, decision, emoji);
  }
  popMatrix();
}