


class Enemy {
  float health;
  int xPos, yPos;
  float sizeMult, sizeW, sizeH;
  float xSpeed, ySpeed;
  PImage sprite, spriteOk, spriteDam, spriteDead;
  boolean alive;
  
  Enemy(){
    health = int(random(5,10));
    xPos = int(random(width));
    yPos = int(random(height));
    xSpeed = random(-2,2);
    ySpeed = random(-2,2);
    sprite = loadImage("kanye.png");
    spriteOk = loadImage("kanye.png");
    spriteDam = loadImage("kanye2.png");
    spriteDead = loadImage("flower.png");
    sizeMult = health * 0.1;
    sizeW = sizeMult * sprite.width;
    sizeH = sizeMult * sprite.height;
    alive = true;
  }
  
  
  void display(){
     imageMode(CENTER);
     image(sprite, xPos, yPos, sizeW, sizeH);
     if (alive){
       sprite = spriteOk;
     }
  }
  
  void move(){
   xPos += xSpeed; 
   yPos += ySpeed;
  }
  
  void update(){
    
    //calculate damage
    if (alive){
      if (dist(mouseX, mouseY, xPos, yPos) < sizeW/2){
        if (mousePressed) {    
          health -= 0.1;
          sprite = spriteDam;
        }
      }
      sizeMult = health * 0.1;
      if (health < 1){
        alive = false;
        sprite = spriteDead;
        sizeMult = 0.5;
      }
      sizeW = sizeMult * sprite.width;
      sizeH = sizeMult * sprite.height;
    }
    
    
    //check the walls
    if (xPos < 0 + sizeW/2 ){
      xPos = int(sizeW/2);
     xSpeed *= -1; 
    }
    
    if (xPos > width - sizeW/2){
      xPos = width - int(sizeW/2);
     xSpeed *= -1; 
    }
    if (yPos < 0 + sizeH/2){
      yPos = 0 + int(sizeH/2);
     ySpeed *= -1; 
      
    }
    if (yPos > height - sizeH/2){
      yPos = height - int(sizeH/2);
     ySpeed *= -1; 
    }
    
  }
  
  
}