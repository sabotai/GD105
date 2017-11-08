
int x;
int y;
int w;
int h;

int bg;
Boolean toTheLeft;


void setup(){
  size(1000,1000);
  x = 0;
  y = height/3;
  w = 100;
  h = 100;
  bg = 0;
  //rectMode(CENTER);
  toTheLeft = false;
}

void draw(){
  background(bg); //set the background to bw
  
  if (mouseX < x){
     toTheLeft = true; 
  } else {
     toTheLeft = false; 
  }
  
  if (mouseX < x || 
       mouseX > x+w || 
       mouseY < y || 
       mouseY > y+h){
      x+=5;
  } else {
    //if ALL of the above things are NOT true
    //meaning the only place the cursor can be is
    //inside the box...
    
    bg++; //increase the value of bw, which we use for the background
    println("you are on the box");
  }
  
  //x represents the left side
  //y ... top side
  //x+w ... right side
  //y+h ... left side
  rect(x, y, w, h);
 
}