
int howMany;

void setup(){
  size(1280,720);
  ellipseMode(CORNER);
}

void draw(){
  float bg = ((millis()/100)%100) + 0;
  println(bg);
  //bg = 5;
  background(bg);
  howMany = int(bg);
  //rotate(1 % sin(millis()/10));
  
  for (int i = 0; i < howMany; i++){
    float x = i * width/howMany;
    int y = 0;
    int size = width/howMany;
    ellipse(x,y,size,size*bg/2); 
  }
  
}