PImage beyonce;
PImage bg;

int bW, bH;
int bX, bY;

void setup(){
  size(1280,720);
  //load each of the images from the data folder
  //make sure the filenames are exact, otherwise they wont load
  beyonce = loadImage("beyonce.png");
  bg = loadImage("godzilla.jpg");
  bg.resize(width, height);
  
  //assign the initial values for beyonce's x, y, width and height
  bX = 0;
  bY = height;
  bW = beyonce.width /5;
  bH = beyonce.height /5;
}

void draw(){
  //we need to set the imageMode to corner at the beginning
  //of each frame for easily setting the background
  imageMode(CORNER);
  image(bg,0,0);
  
  //draw beyonce from the center
  imageMode(CENTER);
  
  //each frame, increase these values
  bX += 1;
  bY *= 1.0055;
  
  bW *= 1.012;
  bH *= 1.01;
  
  //i set a temporary variable to use for the y position
  float tempBY = height + (sin(second()) * 10);
  image(beyonce, bX, tempBY, bW, bH);
  //println("the y value is... " + tempBY);
  //image(beyonce, bX, bY, bW, bH);
  
  //set the text size to be drawn
  textSize(bX);
  
  fill(0,200,0);
  //display the string "ygg" at this position
  text("ygg", 0, height/2);
}

//this function runs every time the mouse is pressed
void mousePressed(){
  
  //i just took all the original assignments from the setup and copy-pasted them
  bX = 0;
  bY = height;
  bW = beyonce.width /5;
  bH = beyonce.height /5;
}