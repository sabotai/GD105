
void drawStuff(){
    
  background(255);
 imageMode(CENTER); //draw any image at the center of our cursor
 image(cat, mouseX, mouseY); //meow
 
 fill(200,0,0); //red fill color
 ellipse(posX, posY, size, size); //draw our ball
 
}

void initChecks(){
  
  float distance = dist(mouseX, mouseY, posX, posY); //current distance between our cursor and the ball
  if (distance < size/2){ //if the distance is less than the collision threshold
     isMoving = true; //start moving our ball
     speedX = mouseX - pmouseX; //take our previous mouseX position to figure out which direction the cursor was coming from
     speedY = mouseY - pmouseY; //we will use the direction and speed of the cursor to determine the speed of our ball
  }
  
}

void checkWalls(){
   
 if (isMoving){ //once the cat has struck
   speedY += gravity; //gravity will add a downward force each frame
   posX = posX + speedX; //move the x position by whatever speed
   posY = posY + speedY; //move the y position by whatever speed
 

  if (posX < 0 + size/2){ //left border collision
    speedX = -speedX; //reverse the direction upon impact
    posX = size/2; //move it to the border to prevent glitchy behavior
  }
  if (posX > width - size/2){ //right border collision
    speedX = -speedX;
    posX = width - size/2;
  }
  if (posY < 0 + size/2){ //top border collision
     speedY = -speedY; 
     posY = size/2;
  }
  if (posY > height - size/2){ //bottom border collision
     speedY = -0.8 * speedY; //they should slow down with each impact, speed at 80% each bounce
     speedX *= 0.8; //also decelerate the x so we dont have it rolling around the ground
     posY = height - size/2; //move it to the border so we dont get weird glitchy behavior
  }
 }
 
}


int giveMeFive(){
  
  return 5;
}

boolean giveMeTruth(){
 return false; 
}

String subway(float dollars){
  if (dollars > 4.35){
    return "a stale sandwich";
  } else {
   return "get da fuq outta herr"; 
  }
  
}