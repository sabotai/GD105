int rectX, rectY, rectW, rectH;

void setup(){
  size(1280, 720);
  rectX = 200;
  rectY = 200;
  rectW = 400;
  rectH = 300;
  stroke(30,65,30);
  fill(0);
}
void draw(){
  background(0);
  if ((mouseX >= rectX) &&  //the cursor must be to the right of rectX AND
      (mouseX <= rectX+rectW) && //the cursor must be to the left of the X and the rects width AND
      (mouseY >= rectY) && //the cursor must be below the top edge AND
      (mouseY <= rectY+rectH)){ //must be above the bottom edge (rectY+rectH)
         //sine will oscillate between -1 and 1 by the speed of change inside ()
         //we are dividing by 120 to slow down the rate of change
         //then multiplying by a number to increase the magnitude of that change
         float oscillate = sin( millis()/120 ) * 13;
         println(oscillate);
         fill(100,250+oscillate,100); //if those 4 conditions are true, change the fill to a random BW value
         //rectW = int(100+oscillate);
         rectY += oscillate;
         rectX += oscillate *-1;
         
         if (mousePressed){ //if all those conditions above are true AND the mouse is pressed, do the following...
          //background(random(255)); //maybe change the background randomly
          int clearW = rectW *2;
          int clearH = rectH *2;
          rectW *= 0.9;
          rectH *= 0.9;
          rectX = int(random(clearW, width - clearW)); //determine a new random x position
          rectY = int(random(clearH, height - clearH)); //determine a new random y position
          fill(0); 
          background(0,170,0);
       }
  } else {
    /*
         if (mousePressed){
            background(255,0,0); 
         }
    */
         fill(0);
       }
  rect(rectX,rectY,rectW,rectH);
}