
class Player {
  int x, y;
  int speed;
  PImage[] sprite;
  boolean running, runRight;
  int frame;
  float fframe;
  PImage[] sprite_idle, sprite_run;
  String title;
  float pScale;

  Player(String chr, int frames, float _scale) {
    x = width/3;
    y = int(height * 0.7);
    speed = 6;
    sprite = new PImage[frames];
    running = false;
    runRight = true;
    sprite_idle = new PImage[frames];
    title = chr;
    pScale = _scale;

    for (int i = 0; i < sprite_idle.length; i++) {
      sprite_idle[i] = loadImage(chr + "/" + chr + i + ".png");
      if (sprite_idle[i] == null) sprite_idle[i] = loadImage(chr + "/" + "idle_" + i + ".png");
        sprite_idle[i].resize(int(pScale * sprite_idle[i].width), 0);
    }
  }

  void setAnim(String animName, int frames) {
    
    switch(animName) {
    case "run":
      sprite_run = new PImage[frames];
      for (int i = 0; i < sprite_run.length; i++) {
        sprite_run[i] = loadImage(title + "/" + animName + "_" + i + ".png");
        sprite_run[i].resize(int(pScale * sprite_run[i].width), 0);
      }
      break;
    }
  }
  

  void update() {
    // if (keyPressed) {
    if (keys[0]) {
      //x -= speed;
      bg.scroll(-this.speed); 
      fg.scroll(-this.speed); 
      running = true;
      runRight = true;
    } else if (keys[1]) {
      //x += speed;
      bg.scroll(this.speed); 
      fg.scroll(this.speed); 
      running = true;
      runRight = false;
    } else {
     running = false; 
     
    }
    
    
    if (running) {
      fframe = (fframe + 0.3) % sprite_run.length;
      frame = int(fframe);
      println("run: " + frame + " " + fframe);
    } else {
      translate(0, 0);
      //scale(-dir, 1);
      fframe = (fframe + 0.1) % sprite_idle.length;
      frame = int(fframe);
      println("idle: " + frame + " " + fframe);
    }
  }

  void display() {
    imageMode(CENTER);
    translate(x, y);
    if (!runRight) {
      scale(-1, 1);
    }
    if (running) {
      image(sprite_run[frame], 0, 0);
    } else {
      //translate(0, 0);
      image(sprite_idle[frame], 0, 0);
    }
  }
}