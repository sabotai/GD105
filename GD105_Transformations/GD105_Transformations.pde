PImage bg, heli;
int transX, transY;
int heliX, heliY;

void setup(){
  size(1280,720);
  bg = loadImage("bg.jpg");
  heli = loadImage("helicoptor.png");
  
  //resizing our image to be twice the size of the window
  bg.resize(width * 2, height * 2);
  
  //making sure it's drawing our images from the center
  imageMode(CENTER);
  
  //initial origin should be (0,0), meaning the top left of the window is (0,0)
  transX = 0;
  transY = 0;
  heliX = width/2;
  heliY = height/2;
}

void draw(){
  //if you want to limit the influence of translations and rotations,
  //you must encapsulate the changes in pushMatrix() and popMatrix()
  pushMatrix();
  //do our translation each frame
  translate(transX, transY);
  //draw the image based upon the new origin
  image(bg, width/2, height/2);
  popMatrix();
  //return to original origin
  
  
  if (mousePressed) {
    pushMatrix();
    //in order to rotate something from the center, translate to its position
    translate(heliX, heliY);
    //rotate it by an amount based upon time
    rotate(degrees(millis()/50));
    //the new position becomes 0,0 since you already translated there
    image(heli, 0, 0);
    popMatrix();
  } else {
    //otherwise...
    //draw this image using the classical origin (top left at 0,0)
    image(heli, heliX, heliY);
  }
  
}

void mouseDragged(){
  //everytime you drag, offset the origin point by how much was dragged
 transX += mouseX - pmouseX;
 transY += mouseY - pmouseY; 
}