
int howMany = 30;
int[] xPos = new int[howMany];
int[] yPos = new int[howMany];
int size = 100;

void setup(){
 size(1920, 1080); 
 for (int i = 0; i < howMany; i++){
  xPos[i] = int(random(width));
  yPos[i] = int(random(height));
 }
}

void draw(){
  background(100);
  for (int i = 0; i < howMany; i++){
   ellipse(xPos[i], yPos[i], size, size);
  }
  
}

void mouseDragged(){
  
  for (int i = 0; i < howMany; i++){
   if (dist(mouseX, mouseY, xPos[i], yPos[i]) < size/2){
      xPos[i] = mouseX;
      yPos[i] = mouseY;
   }
  }
}