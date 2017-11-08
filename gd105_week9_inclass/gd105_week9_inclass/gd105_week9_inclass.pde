float posX, posY;
float speedX, speedY;
float size;
float gravity = 0.4;
boolean isMoving;

PImage cat = new PImage();

void setup(){
  size(1280,720);
  cat = loadImage("Cat-PNG-6.png");
  posX = random(width);
  posY = random(height);
  size = 70; //ball size/diameter
  
  speedX = 0; //dont move at first
  speedY = 0;
  isMoving = false; //i said dont move at first!
}

void draw(){
   initChecks();
   drawStuff();
   checkWalls();
}