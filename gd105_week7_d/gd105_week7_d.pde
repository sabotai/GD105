
//drag random ellipses around the screen and save positions

int howMany = 5;
Boolean[] onOff = new Boolean[howMany];
Boolean mClick = false;
int xPos[] = new int[howMany];
int yPos[] = new int[howMany];
int dia = 100;

ArrayList<PVector> blackPoints = new ArrayList<PVector>();
PVector[] black = new PVector[3];
PVector[] white = new PVector[3];
    
void setup() {
  size(1280, 720);

  for (int i = 0; i < howMany; i++) {
    onOff[i] = false;

    xPos[i] = int(random(width));
    yPos[i] = int(random(height));
  }
  
  for (int i = 0; i < 3; i++){
   black[i] = new PVector(0, 0);
   white[i] = new PVector(0, 0);
  }
}

void draw() {
  background(200,50,50);
  //we use 'i' to iterate through our loop
  //we run the loop again as long as (i<howMany)

  int numBlack = 0;
  for ( int i = 0; i < howMany; i++ ) { 
    //how can we make howMany fit within the space of width...

    float prox = dist(mouseX, mouseY, xPos[i], yPos[i]);

    fill(255); 

    if (prox < dia/2 && mClick) {
      if (!onOff[i]){ //add newly clicked ones to arraylist
         blackPoints.add(new PVector(xPos[i], yPos[i])); 
      } else { //remove old ones
        for (int j = 0; j < blackPoints.size(); j++){
          println("seeking " + blackPoints.get(j) + " vs. " + new PVector(xPos[i], yPos[i]));
         if (blackPoints.get(j).dist(new PVector(xPos[i], yPos[i])) <= 0){
          blackPoints.remove(j); 
          println("removed one");
         }
        }
      }
      
      onOff[i] = !onOff[i]; //reverse the switch
      mClick = false; //reset the click
      println("flip " + onOff[i] + " for " + i);
    }
    if (onOff[i]) {
      if (numBlack < 3) numBlack++;
      black[numBlack-1] = new PVector(xPos[i], yPos[i]);
      fill(0);
    }
    
    for (int j = 0; j < blackPoints.size(); j++){
     if (j>=1){
       
       line( blackPoints.get(j-1).x, blackPoints.get(j-1).y, blackPoints.get(j).x, blackPoints.get(j).y);
     }
    }
    
    /*
    if (black[0] != new PVector(0, 0)){
      if (black[1] != new PVector(0, 0)){
       line(black[0].x, black[0].y, black[1].x, black[1].y); 

        if (black[2] != new PVector(0, 0)){
       line(black[1].x, black[1].y, black[2].x, black[2].y); 
        }
      }
    }
    */
    ellipse(xPos[i], yPos[i], dia, dia);
  }
}

void mouseClicked() {
  mClick = true;
}

void mouseDragged(){
  
  for (int i = 0; i < howMany; i++){
   if (dist(mouseX, mouseY, xPos[i], yPos[i]) < dia/2){
     println("drag");
      xPos[i] = mouseX;
      yPos[i] = mouseY;
   }
  }
}