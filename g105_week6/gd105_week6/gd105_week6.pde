PImage face; //new face object/container
int xPos, yPos; //variables to track our x and y positions
float xSpeed, ySpeed; //track the speeds along x and y axes

int faceDia; //a variable to hold the diameter of our image(face)

void setup(){
 size(1280,720); 
 face = loadImage("face.png"); //load the image which is inside our data folder
 xPos = width/2; //start in the middle along the x axis
 yPos = height/2; //start along the middle of the y axis
 xSpeed = random(1,10); //set the x speed to a random value bw 1 and 10 (moving to the right)
 ySpeed = random(1,10);//set the y speed to a random value bw 1 and 10 (moving down)
 faceDia = 200; //setting the diameter of the face
}

void draw(){
  
  int a = 1;//alpha of 1/255
  fill(255, a); //use the color white, with an alpha of 1(1/255 transparency)
  rect(0,0,width,height); //draw a rectangle that starts in the top left and goes to the bottom right
  //this will create the trail effect that disappears over time
  
  
  xPos += xSpeed; //move the x position by xSpeed each frame
  yPos += ySpeed; //move the y position by ySpeed each frame
  image(face, xPos, yPos, faceDia, faceDia); //draw our face at x,y with a diameter of faceDia
  
  if(xPos > width - faceDia || xPos < 0){ //if we pass the right or left boundaries on the x 
     xSpeed = -xSpeed; //if ^, reverse the x direction
  }
  
  if(yPos > height - faceDia || yPos < 0){ //same for the top and bottom
     ySpeed = -ySpeed; //same as ySpeed *= -1; 
  }
}

void keyPressed(){ //this function will run anytime a key is pressed by the user
  
  if (keyCode == UP){ //if that key that was pressed is UP, do the following
   println("UPUPUPUPUPUPUPUuUU"); 
   ySpeed *= 1.05; //increase the speed by 5%
  }
   if (keyCode == DOWN){
   println("dwwwnnnnn"); 
   ySpeed /= 1.05; //if down, decrease y speed
  }
    if (keyCode == LEFT){
   println("luft"); 
   xSpeed /= 1.05;
  }
    if (keyCode == RIGHT){
   println("roight"); 
   xSpeed *= 1.05;
  }
  
  
  println("xS = " + xSpeed + "   yS = " + ySpeed); //tell us what the current speeds are
}