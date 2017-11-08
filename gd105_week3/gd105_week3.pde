PImage beyonce;
PImage bg;

int beyonceW, beyonceH;
int beyonceX, beyonceY;

void setup(){
  size(1280,720);
  bg = loadImage("godzilla.jpg");
  beyonce = loadImage("beyonce.png"); 
  beyonceW = 112;
  beyonceH = 166;
  beyonceX = 0;
  beyonceY = height/2;
}

void draw(){
  //make beyonce wider each frame
  beyonceW = beyonceW + 5;
  //make beyonce taller each frame
  beyonceH = int( beyonceW * 1.1 );
  
  //make beyonce move right over time
  beyonceX = millis() / 40;
  //make beyonce move up and down with sin and position her 3/4 of the way down
  beyonceY = int( height/1.2 + (20 * sin(beyonceX)) );
  println("a message... like beyonceW is equal to... " + beyonceW);
  
  //try using "tint(*, *, *, *);"
  imageMode(CORNER);
  image(bg, 0, 0, width, height);
  
  //try using filter to make the scene blend
  imageMode(CENTER);
  image(beyonce,beyonceX,beyonceY, beyonceW, beyonceH); 
  //filter(THRESHOLD, 0.7);
}