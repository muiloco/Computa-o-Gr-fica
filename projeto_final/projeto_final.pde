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
        //translate(posx+150, posy+150, 0);
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
    void draw(){
        //translate(posx+20, posy+20, 75.5);
        fill(cor);
        ellipse(posx+5, posy, 30, 60);
        ellipse(posx+75, posy, 30, 60);
        //sphere(20);
    }

}

// classe da boca
 class Boca  {

     Boca (float x, float y, color c) {
        
    }
    void draw(){
        
    }

}

// classe Geral
 class Emoji  {

    Emoji (float x, float y, color c) {
        
    }
    void draw(){
        
    }

}

void setup(){
  size(512, 512,P3D);
  rectMode(CENTER);
}
void draw(){
  background(250);
  Corpo corpo = new Corpo(100,100,100);
  Olhos olho = new Olhos(0, 0, 255);
  translate(width/2, height/2);
  rotateX(-mouseY*PI/256);
  rotateY(-mouseX*PI/256);
  corpo.draw();
  olho.draw();
}
/*size(512, 512,P3D);
Corpo corpo = new Corpo(100,100,100);
Olhos olho = new Olhos(0, 0, 255);
corpo.draw();
olho.draw();*/
// Animação e rotação
// Iluminição
