
Enemy baddie;
Enemy baddies[];

void setup(){
  size(1280,720);
  baddies = new Enemy[5];
  baddie = new Enemy();
  
  for (int i = 0; i < baddies.length; i++){
   baddies[i] = new Enemy(); 
  }
}

void draw(){
  background(0);
  baddie.update();
  baddie.display();
  baddie.move();
  
  for (int i = 0; i < baddies.length; i++){
    
  baddies[i].update();
  baddies[i].display();
  baddies[i].move();
    
  }
}