
int howMany = 100;


//set up new arrays(lists) of on/off state, x and y positions.  use howMany to set up the right number of positions
int[] ellipseX = new int[howMany]; //array(list) of x positions
int[] ellipseY = new int[howMany]; //array of y positions
int[] ellipseSize = new int[howMany]; //array of diameters
int[] xSpeed = new int[howMany]; //array of xSpeeds
boolean[] on = new boolean[howMany]; //array of on/off

void setup(){
  size(1280,720);
   //use a loop to assign each one of the x and y positions to a random spot in the window
   //also random speeds and sizes
 //also set all the onOff switches to false
   for (int i = 0; i < howMany; i++){
     ellipseX[i] = int(random(width));
     ellipseY[i] = int(random(height));
     ellipseSize[i] = int(random(50,200));
     xSpeed[i] = int(random(-5,5));
     on[i] = false;
   }
}
void draw(){
  background(255);
   for (int i = 0; i < howMany; i++){
     if (on[i]){//check if this particular array position (think list item) is switched on
      fill(255); //if true, set the fill to white and move it down each frame
     } else {
      fill(0); //if false, set the fill to black and move it down each frame
     }
     ellipseX[i] += xSpeed[i]; //move each ellipse by xspeed
     //draw each ellipse using i to cycle through
     ellipse(ellipseX[i], ellipseY[i], ellipseSize[i], ellipseSize[i]);
   }
}
void mouseReleased(){
  
   for (int i = 0; i < howMany; i++){
     
     //check if the proximity is less than the radius of the ellipses (ellipseSize/2)
     if (dist(mouseX,mouseY,ellipseX[i], ellipseY[i]) < ellipseSize[i]/2){
       //if it is... stop it
       xSpeed[i] = 0;
       //and switch its boolean value
       on[i] = !on[i];
     }
   }
}

void mouseDragged(){ 
   for (int i = 0; i < howMany; i++){
     //if its close enough and being dragged...
     if (dist(mouseX,mouseY,ellipseX[i], ellipseY[i]) < ellipseSize[i]/2){
      //...then update the position to be the same as the cursor
       ellipseX[i] = mouseX;
      ellipseY[i] = mouseY;
     }
   }
}