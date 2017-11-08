class Enemy {
  
  PImage sprite; //current image being displayed
  PImage okSprite; //default/ok image
  PImage hurtSprite; //hurt image to switch to once the enemy takes damage
  int xPos, yPos; //every enemy needs an x and y position
  float xSpeed, ySpeed; //every enemy needs x and y speeds
  float wSize, hSize; //every enemy has a different width and height
  float mult; //we will use mult to scale the size proportionally
  float health; //keep track of health
  boolean alive; //only living enemies do stuff
  
  Enemy(){ //this is the constructor, which runs when you initialize your enemy(i.e., Enemy myEnemy = new Enemy();
    health = random(5,10); //random value between 5 and 10
    xPos = int(random(width)); //random x position between 0 and width
    yPos = int(random(height)); //random y position between 0 and height
    xSpeed = random(-2, 2); //random x speed between -2 and 2
    ySpeed = random(-2, 2); //random y speed between -2 and 2
    alive = true; //start off alive
    sprite = loadImage("kanye.png"); //start off with ok kanye
    okSprite = loadImage("kanye.png"); //we need to keep the ok image so we can switch it back
    hurtSprite = loadImage("kanye2.png"); //this is the injured kanye to switch when he takes damage
    mult = 0.1 * health; //we use the mult with health so the size represents how much health they have
    wSize = sprite.width * mult; //scale the width by mult
    hSize = sprite.height * mult; //scale the height by mult
  }
  
  void update(){ //this is the method in which we update most values
    //move the x and y positions by their speeds
    xPos += xSpeed; 
    yPos += ySpeed;
    
    //check against the left wall
    if (xPos < 0){
     xSpeed *= -1; //reverse the direction
     xPos = 0; //make sure it hasnt gone beyond so it doesnt keep flipping directions, looking stuck
    }
    //...right wall
    if ( xPos > width){
      xSpeed *= -1;
      xPos = width;
    }
    //...top wall
    if (yPos < 0){
     ySpeed *= -1; 
     yPos = 0;
    }
    //...bottom wall
    if (yPos > height){
     ySpeed *= -1; 
     yPos =height;
    }
    sprite = okSprite; //reset the sprite to the default image
  }
  
  void takeDamage(){ //this is a method to check for damage
    if (alive){ //only living things take damage
     if (dist(mouseX, mouseY, xPos, yPos) < wSize/2){ //if the mouse is in the right position
       if (mousePressed){ //...also if they are pressing the mouse
         health -= 0.1; //lower the health
         mult = health * 0.1; //update mult to reflect the new scale
         wSize = mult * sprite.width; //set the width proportionally
         hSize = mult * sprite.height; //...and height
         sprite = hurtSprite; //use the hurtsprite for player feedback
       }
     } 
    }
  }
  
  void display(){ //this is the method used for displaying a given enemy
    imageMode(CENTER); //draw it from the center
    image(sprite, xPos, yPos, wSize, hSize); //draw our sprite
  }
  
  
}