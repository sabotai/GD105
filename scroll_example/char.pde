
class Player {
  int x, y;
  int speed;
  PImage[] sprite;
  boolean running, runRight;

  Player(String chr, int frames) {
    x = width/3;
    y = int(height * 0.74);
    speed = 3;
    sprite = new PImage[frames];
    running = false;
    runRight = true;



    for (int i = 0; i < sprite.length; i++) {
      sprite[i] = loadImage(chr + "/" + chr + i + ".png");
      sprite[i].resize(80, 0);
    }
  }


  void update() {
    if (keyPressed) {
      if (key == 'd') {
        //x -= speed;
        running = !running;
        runRight = true;
      }

      if (key == 'a') {
        //x += speed;
        running = !running;
        runRight = false;
      }
    } else {
      running = false;
    }
  }

  void display() {
    imageMode(CENTER);
    translate(x, y);
    if (!runRight) {
      scale(-1,1);
    }
    if (running) {
      if (frameCount % 2 == 0) {
        image(sprite[1], 0, 0);
      } else {
        image(sprite[0], 0, 0);
      }
    } else {
      image(sprite[0], 0, 0);
    }
    translate(0, 0);
    //scale(-dir, 1);
  }
}