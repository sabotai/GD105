
Enemy baddie;

void setup(){
  size(1280,720);
  baddie = new Enemy();
}

void draw(){
  background(0);
  baddie.update();
  baddie.display();
  baddie.move();
}