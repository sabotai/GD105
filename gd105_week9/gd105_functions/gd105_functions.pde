float posX, posY;
float speedX, speedY;
float size;
float gravity = 0.4;
boolean isMoving;

PImage cat = new PImage();

void setup() {
  size(1280, 720);
  cat = loadImage("Cat-PNG-6.png");
  posX = random(width);
  posY = random(height);
  size = 70; //ball size/diameter

  speedX = 0; //dont move at first
  speedY = 0;
  isMoving = false; //i said dont move at first!
}
void draw() {

  float distance = dist(mouseX, mouseY, posX, posY); //current distance between our cursor and the ball
  if (distance < size/2) { //if the distance is less than the collision threshold
    isMoving = true; //start moving our ball
    speedX = mouseX - pmouseX; //take our previous mouseX position to figure out which direction the cursor was coming from
    speedY = mouseY - pmouseY; //we will use the direction and speed of the cursor to determine the speed of our ball
  }

  background(255);
  imageMode(CENTER); //draw any image at the center of our cursor
  drawCat(mouseX, mouseY);
  

  fill(200, 0, 0); //red fill color
  ellipse(posX, posY, size, size); //draw our ball

  if (isMoving) { //once the cat has struck
    speedY += gravity; //gravity will add a downward force each frame
    posX = posX + speedX; //move the x position by whatever speed
    posY = posY + speedY; //move the y position by whatever speed


    if (posX < 0 + size/2) { //left border collision
      speedX = -speedX; //reverse the direction upon impact
      posX = size/2; //move it to the border to prevent glitchy behavior
    }
    if (posX > width - size/2) { //right border collision
      speedX = -speedX;
      posX = width - size/2;
    }
    if (posY < 0 + size/2) { //top border collision
      speedY = -speedY; 
      posY = size/2;
    }
    if (posY > height - size/2) { //bottom border collision
      speedY = -0.8 * speedY; //they should slow down with each impact, speed at 80% each bounce
      speedX *= 0.8; //also decelerate the x so we dont have it rolling around the ground
      posY = height - size/2; //move it to the border so we dont get weird glitchy behavior
    }
  }
}


void mouseReleased() {
  // save("diagonal.tif");
}

void drawCat(float catX, float catY){
  
  pushMatrix();
  if (mousePressed) {
    translate(catX, catY);
    rotate(degrees(millis()/50));
    catX = 0;
    catY = 0;
  }
  image(cat, catX, catY); //meow
  popMatrix();
  
}