float zoom = 1;
final static float inc = .1;
class Square{
  PShape squareShape;
  float posX;
  float posY;
  color colr;
  Square(){
    posX=0;
    posY=0;
    colr = color(0,0,255);
    squareShape = createShape();
    squareShape.beginShape();
    
    squareShape.vertex(posX+30, posY+40);
    squareShape.vertex(posX+80, posY+40);
    squareShape.vertex(posX+80, posY+75);
    squareShape.vertex(posX+30, posY+75);
    
    squareShape.endShape(CLOSE);
  }
  Square(color c, float posX, float posY){
    colr = c;
    squareShape = createShape();
    squareShape.beginShape();
    
    squareShape.vertex(posX+30, posY+40);
    squareShape.vertex(posX+80, posY+40);
    squareShape.vertex(posX+80, posY+75);
    squareShape.vertex(posX+30, posY+75);
    
    squareShape.endShape(CLOSE);
  }
  void display(){
    stroke(0);
    fill(colr);
    shape(squareShape);
  }
}

class Triangle{
  PShape triangleShape;
  float posX;
  float posY;
  color colr;
  Triangle(){
    posX=0;
    posY=0;
    colr = color(0,0,255);
    triangleShape = createShape();
    triangleShape.beginShape(TRIANGLES);
    
    triangleShape.vertex(posX+10, posY+40);
    triangleShape.vertex(posX+100, posY+40);
    triangleShape.vertex(posX+55, posY+20);
    
    triangleShape.endShape(CLOSE);
  }
  Triangle(color c, float posX, float posY){
    colr = c;
    triangleShape = createShape();
    triangleShape.beginShape();
    
    triangleShape.vertex(posX+10, posY+40);
    triangleShape.vertex(posX+100, posY+40);
    triangleShape.vertex(posX+55, posY+20);
    
    triangleShape.endShape(CLOSE);
  }
  void display(){
    stroke(0);
    fill(colr);
    shape(triangleShape);
  }
}

class House{
  Square houseWall;
  Triangle houseRoof;
  color colr;
  House(){
    houseWall = new Square();
    houseRoof = new Triangle();
    colr = color(0, 0, 255);
  }
  void display(){
    pushMatrix();
    houseWall.display();
    houseRoof.display();
    popMatrix();
  }
}
  

Square square1;
Triangle triangle2;
House house;

void setup(){
  size(600,600);
  //square1 = new Square(color(0, 0, 255), 0, 0);
  //triangle2 = new Triangle(color(0, 0, 255), 0, 0);
  house = new House();
}
void draw(){
   if(mousePressed && (mouseButton == LEFT)){
      zoom += inc;
    }
  stroke(0);
  fill(255);
  //square1.display();
  //triangle2.display();
  scale(zoom);
  house.display();
  
}
