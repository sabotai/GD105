boolean wearShades;
boolean wearBandana;
boolean eatenShades;

PImage doge;
PImage shades;
PImage bandana;

int bandanaX, bandanaY;
int shadesX, shadesY;

void setup() {
  size(1280, 720); 
  wearShades = true;
  doge = loadImage("doge.jpg");
  doge.resize(width, height);
  shades = loadImage("shades.png");
  shades.resize(400, 100);
  eatenShades = false;

  bandana = loadImage("bandana.png");
  bandana.resize(500, 500);

  shadesX = 300;
  shadesY = 100;

  bandanaX = 500;
  bandanaY = 200;
}
void draw() {
  //we reset imagemode to corner so we can draw the doge image across the whole screen easily
  imageMode(CORNER);
  image(doge, 0, 0);
  
  //we want to use imagemode center for the objects
  imageMode(CENTER);
  //if the shades havent been eaten, do the following...
  if (!eatenShades){
    //if wearShades is true, do the following
    if (wearShades) {
      //draw our shades
      image(shades, shadesX, shadesY);
    }
  }
  if (wearBandana) {
    image(bandana, bandanaX, bandanaY);
  }
  
  //we used this println to help us locate the correct positions
  println(mouseX + ", " + mouseY);
  //if the distance between the mouse (at roughly 600 and 280) and shades is less than a certain threshold
  if (dist(600, 280, shadesX, shadesY) < 70) {
    //that means it has been eaten
   eatenShades = true; 
  }

}

//this function runs everytime any key is pressed
void keyPressed() {
  //if the key that was pressed is the letter s...
  if (key == 's') {  
    //make wearShades the opposite state ... if true, make false; if false, make true
    wearShades = !wearShades;
  }
  //if the key that was pressed is the letter b...
  if (key == 'b') {
    wearBandana = !wearBandana;
  }
}

//this function runs anytime the mouse is dragged
void mouseDragged() {
  //if the distance between the 2 points (x1, y1, x2, y2) is less than a certain threshold, do something
  if (dist(mouseX, mouseY, shadesX, shadesY) < shades.width/2) {
    //we can make a smooth movement based on the distance traveled between frames
    //if we subtract the previous mouse position from the current one and use
    //that to offset our shades positions
    shadesX += mouseX - pmouseX;
    shadesY += mouseY - pmouseY;
  }
  if (dist(mouseX, mouseY, bandanaX, bandanaY) < bandana.width/2) {
    //or we can tie the position of the object to our mouse position, which
    //is simpler, but doesnt look/feel as nice
    bandanaX = mouseX;
    bandanaY = mouseY;
  }
}