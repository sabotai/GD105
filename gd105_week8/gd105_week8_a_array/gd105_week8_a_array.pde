float posX[] = new float[10];
float posY[] = new float[10];
float speedX[] = new float[10];
float speedY[] = new float[10];
float size;
float gravity = 0.4;
boolean isMoving[] = new boolean[10];

PImage cat = new PImage();

void setup() {
  size(1280, 720);
  cat = loadImage("Cat-PNG-6.png");
  for (int i = 0; i < posX.length; i++) {
    posX[i] = random(width);
    posY[i] = random(height);
    speedX[i] = 0; //dont move at first
    speedY[i] = 0;
  isMoving[i] = false; //i said dont move at first!
  }
  size = 70; //ball size/diameter

}
void draw() {

  background(255);
  imageMode(CENTER); //draw any image at the center of our cursor
  image(cat, mouseX, mouseY); //meow

  for (int i = 0; i < posX.length; i++) {
    float distance = dist(mouseX, mouseY, posX[i], posY[i]); //current distance between our cursor and the ball
    if (distance < size/2) { //if the distance is less than the collision threshold
      isMoving[i] = true; //start moving our ball
      speedX[i] = mouseX - pmouseX; //take our previous mouseX position to figure out which direction the cursor was coming from
      speedY[i] = mouseY - pmouseY; //we will use the direction and speed of the cursor to determine the speed of our ball
    }


    fill(200, 0, 0); //red fill color
    ellipse(posX, posY, size, size); //draw our ball

    if (isMoving[i]) { //once the cat has struck
      speedY[i] += gravity; //gravity will add a downward force each frame
      posX[i] = posX[i] + speedX[i]; //move the x position by whatever speed
      posY[i] = posY[i] + speedY[i]; //move the y position by whatever speed


      if (posX[i] < 0 + size/2) { //left border collision
        speedX[i] = -speedX[i]; //reverse the direction upon impact
        posX[i] = size/2; //move it to the border to prevent glitchy behavior
      }
      if (posX[i] > width - size/2) { //right border collision
        speedX[i] = -speedX[i];
        posX[i] = width - size/2;
      }
      if (posY[i] < 0 + size/2) { //top border collision
        speedY[i] = -speedY[i]; 
        posY[i] = size/2;
      }
      if (posY[i] > height - size/2) { //bottom border collision
        speedY[i] = -0.8 * speedY[i]; //they should slow down with each impact, speed at 80% each bounce
        speedX[i] *= 0.8; //also decelerate the x so we dont have it rolling around the ground
        posY[i] = height - size/2; //move it to the border so we dont get weird glitchy behavior
      }
    }
  }
}