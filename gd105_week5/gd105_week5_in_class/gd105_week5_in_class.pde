
//declaring variable to keep track of our rectangle parameters
int rectX, rectY, rectW, rectH;
int lvlNum;

void setup(){
 size(1280,720); 
 rectX = width/2;
 rectY = height/3;
 rectW = 300;
 rectH = 200;
 fill(0); //set the initial fill to black
 lvlNum = 1;
}


void draw(){
  //reset the background color each frame
  background(0);
  
  if (lvlNum >= 5){
   //do win thing
   println("they won");
   textSize(100);
   fill(200);
   text("winzzzzsdfasdfasd", width/2, height/2);
  }
  
  
  if ( mouseX >= rectX && //checked if mouseX to the right of the left edge
       mouseX <= rectX + rectW && //checked if mouseX to the left of right edge
       mouseY >= rectY && //checked if mouseY below the top edge
       mouseY <= rectY + rectH) { //checked if mouseY less than bottom edge
       
       //create a new variable to keep track of oscillation
       //we use millis() for the X value which always increases
       //we divide by 100 to make it 10% as fast so it isnt freaking out
       //we then multiply the magnitude by 15, so it oscillates bw -15 and 15
       float oscillate = sin( millis()/100 ) * 15;
       
       //println(oscillate);
       rectX += oscillate; //move the rectX post by oscillate
       rectY += oscillate; //move the rectY pos by oscillate
       fill(100,240 + oscillate * 2,100); //change the green value of the fill by oscillate * 2
         
       if ( mousePressed ) { //they win the level
         lvlNum++;
         background(0,200,0); //flash the bg so the player knows they got it
         rectX = int(random(width - rectW)); //reset the box x pos to a new pos
         rectY = int(random(height - rectH)); //reset the box y pos to a new pos
         rectW *= 0.9; //make the box 90% of its old size
         rectH *= 0.9; //make the box 90% of its old size
       }
       //println("inside");
   } else {
      //println("outside"); 
      fill(0); //make sure the box fills black when we arent hovering
   }

    rect(rectX, rectY, rectW, rectH); //draw the rectangle  
}