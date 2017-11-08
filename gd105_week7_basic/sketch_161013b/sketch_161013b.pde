int howMany = 10;

//set up new arrays(lists) of on/off state, x and y positions.  use howMany to set up the right number of positions
Boolean[] onOff = new Boolean[howMany];
int[] xPos = new int[howMany];
int[] yPos = new int[howMany];

//keep track of the diameter
int dia = 50;

//we are using a variable to keep track of whether the player just clicked or not
Boolean mClick = false;

void setup(){
 size(1280,720);
 
 //use a loop to assign each one of the x and y positions to a random spot in the window
 //also set all the onOff switches to false
 for (int i = 0; i < howMany; i++){
   xPos[i] = int(random(0, width));
   yPos[i] = int(random(0, height));
   onOff[i] = false;
 
 }
}
void draw(){
  background(80, 220, 80);
  
  for ( int i = 0; i < howMany; i++ ) { 
    //create a variable, prox, to check the distance between the cursor and the current ellipse being drawn
     float prox = dist(mouseX, mouseY, xPos[i], yPos[i]);
     
     
     if (onOff[i]){ //check if this particular array position (think list item) is switched on
       //if true, set the fill to black and move it down each frame
      fill(0); 
      yPos[i]++;
     } else {
       //if false, set the fill to white and move its y position up
       fill(255);
       yPos[i]--;
     }
     
     //check if the proximity is less than the diameter of the ellipses (dia/2)
     if (prox < dia/2){
      fill(255,0,0); //if it is, set the current fill to red to show that you are hovering over it
       
       //now check if mClick is true, meaning the user clicked the mouse
       if (mClick){ 
        onOff[i] = !onOff[i]; //flip the switch for this ellipse to the opposite... if true, make false, if false, make true
        mClick = false; //reset mClick to false since we completed the click action and want to check again
       }
     }  
     //draw each ellipse as the loop iterates
     ellipse(xPos[i],yPos[i],dia,dia); 
  }
}

void mouseClicked(){
  //if they just clicked, set mClick to true
  mClick = true;
}