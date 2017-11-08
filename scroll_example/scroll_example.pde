
Layer bg, fg;

Player mario;

void setup(){
  size(1024, 1024);
  bg = new Layer("data/mariobg.png", 0);
  fg = new Layer("data/mariofg.png", 1);
  mario = new Player("mario", 2);
}

void draw(){
  println(frameRate);
  background(255);
  bg.display();
  fg.display();
  
  mario.update();
  mario.display();
  
}


void keyPressed(){
 
    if (key=='d'){ 
     bg.scroll(-mario.speed); 
     fg.scroll(-mario.speed); 
    }
    if (key=='a'){ 
     bg.scroll(mario.speed); 
     fg.scroll(mario.speed); 
    }
}