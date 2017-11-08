

float xPos, yPos, xSpeed, ySpeed, gravity;
int dia;
PImage west = new PImage();
PImage drake = new PImage();


void setup(){
  size(1280,720);
  xPos = random(width);
  yPos = random(height);
  dia = 50;
  west = loadImage("Kanye-West-PNG.png");
  drake = loadImage("drake.png");
  west.resize(dia*2, dia*2);
  xSpeed = 0;
  ySpeed = 0;
  gravity = 0.4;
}

void draw(){
  background(255);
  //how far is the target from the cursor?
  float distance = dist(mouseX, mouseY, xPos, yPos);
  //if it collides, use the speed of the cursor as the speed of the ball
  //to get the speed, you subtract the previous position from the current position
  //for example, if you traveled from position 0 to position 60 in 1 second
  //, the speed would be 60 positions/second
  if (distance < dia/2){
   xSpeed = mouseX - pmouseX;
   ySpeed = mouseY - pmouseY;
  }
  //every frame, gravity should be making ySpeed greater (pulling it downward)
  ySpeed += gravity;
  xPos += xSpeed;
  yPos += ySpeed;
  
  if (xPos < 0 + dia/2){
   xSpeed *= -1; 
   xPos = 0 + dia/2;
  }
  if (xPos > width - dia/2){
   xSpeed *= -1; 
   xPos = width - dia/2;
  }
  if (yPos < 0 + dia/2){
   ySpeed *= -1; 
   yPos = 0 + dia/2;
  }
  if (yPos > height - dia/2){
    //each time it bounces off the bottom, we create fake friction by making the speed 80% of what it was
    ySpeed *= -0.8;  
    xSpeed *=0.8;
    yPos = height - dia/2;
  }
  
  //these are examples of custom functions
  //when you "call" the functions in the next few lines, the parameters in the parentheses get passed into the function
  drawStuff("lol", 1);
  //in this example, our custom subtract function will print 40 into the console,
  //because 
  println(subtract(50,10));
  //our sayHi() function just prints "hi!" into the console whenever it is called
  sayHi();
}
int subtract(int a, int b){
  int sub = a - b;
  //return will teleport the value of sub back to wherever the function is called, so 40 will be passed into the println above
  return sub;
}

//in this example, the drawStuff function gets called above, "lol" gets passed into "passedString"
//and a value of 1 is assigned to growth
void drawStuff(String passedString, int growth){
  println("string= " + passedString);
  imageMode(CENTER);
  image(drake, mouseX, mouseY);
  dia+=growth;
  west.resize(dia*2, dia*2);
  ellipse(xPos, yPos, dia, dia);
  image(west, xPos, yPos);
}

void sayHi(){
 println("hi!"); 
}