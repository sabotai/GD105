
//drag random ellipses around the screen and save positions

int howMany = 5;
Boolean[] onOff = new Boolean[howMany];
Boolean mClick = false;
int xPos[] = new int[howMany];
int yPos[] = new int[howMany];
    int dia = 100;
    
void setup() {
  size(1280, 720);

  for (int i = 0; i < howMany; i++) {
    onOff[i] = false;

  xPos[i] = int(random(width));
  yPos[i] = int(random(height));
  }
}

void draw() {
  background(200,50,50);
  //we use 'i' to iterate through our loop
  //we run the loop again as long as (i<howMany)

  for ( int i = 0; i < howMany; i++ ) { 
    //how can we make howMany fit within the space of width...

    float prox = dist(mouseX, mouseY, xPos[i], yPos[i]);

    fill(255); 

    if (prox < dia/2 && mClick) {
      onOff[i] = !onOff[i];
      mClick = false;
      println("flip " + onOff[i] + " for " + i);
    }
    if (onOff[i]) {
      fill(0);
    }
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