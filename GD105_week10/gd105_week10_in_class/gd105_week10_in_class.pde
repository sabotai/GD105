
Enemy baddie; //declaring a single enemy object called baddie
Enemy[] baddies; //declaring an array of enemy objects called baddies

void setup(){
  size(1280,720);
  baddies = new Enemy[10]; //how many in the array?
  
  for (int i =0; i < baddies.length; i++){
    baddies[i] = new Enemy(); //initialize each one of the baddies in the array
  }
  
  baddie = new Enemy(); //initializing
}

void draw(){
  background(0);
  
  baddie.update(); //run the baddie update method
  baddie.takeDamage(); //run the badde take damage method
  baddie.display(); //run the display method for baddie
  
  //we need to use a for loop for baddies, so we can do it however many times are necessary
  for (int i =0; i < baddies.length; i++){
    baddies[i].update();
    baddies[i].takeDamage();
    baddies[i].display();
  }
  
}