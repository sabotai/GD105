
int howMany = 5;
Boolean[] onOff = new Boolean[howMany];
Boolean mClick = false;

void setup() {
  size(1280, 720);


  for (int i = 0; i < howMany; i++) {
    onOff[i] = false;
  }
}

void draw() {

  //we use 'i' to iterate through our loop
  //we run the loop again as long as (i<howMany)

  for ( int i = 0; i < howMany; i++ ) { 
    //how can we make howMany fit within the space of width...
    int size = width/howMany;
    int x = i * width/howMany + (size/2); //space these out based on howMany
    int y = height/2 - size/2; //put it in the middle

    float prox = dist(mouseX, mouseY, x, y);

    fill(255); 

    if (prox < size/2 && mClick) {
      onOff[i] = !onOff[i];
      mClick = false;
      println("flip " + onOff[i] + " for " + i);
    }
    if (onOff[i]) {
      fill(0);
    }
    ellipse(x, y, size, size);
  }
}

void mouseClicked() {
  mClick = true;
}