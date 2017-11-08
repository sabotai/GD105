
PImage face;
float xPos, yPos;
float imgDia;
float xSpeed, ySpeed;

void setup(){
 size(1280, 720); 
 face = loadImage("face.png");
 
 //pick a random position somewhere on the x and y axis
 xPos = int(random(0, width-imgDia));
 yPos = int(random(0, height-imgDia));
 
 imgDia = 100;
 //give us a random speed and direction for x and y
 //negative means move up/left and positive means move down/right
 xSpeed = int(random(-5,5));
 ySpeed = int(random(-5,5));
}

void draw(){
  image(face, xPos, yPos, imgDia, imgDia);
  //move the x position by xSpeed
  xPos += xSpeed;
  //move the y position by ySpeed
  yPos += ySpeed;
  
  //check if the x has gone past the left or right sides
  //we subtract imgDia since we are drawing it from the top left...
  //...and dont want it to go off screen
  if (xPos > width - imgDia || xPos < 0){
    //reverse the speed/direction
   xSpeed = -xSpeed; 
  }
  
  //do the same for the y axis
   if (yPos > height - imgDia || yPos < 0){
   ySpeed = -ySpeed; 
  }
  
  //increase x and y speeds by 1% each frame for funzies
  xSpeed *= 1.01;
  ySpeed *= 1.01;
  //increase the scale of the image by 0.5% each frame for intimidation factor
  imgDia *= 1.005;
}