boolean[] keys;

Layer bg, fg;

Player mario, psylocke;

void setup(){
  size(1024, 1024);
  bg = new Layer("data/mariobg.png", 0);
  fg = new Layer("data/mariofg.png", 1);
  mario = new Player("mario", 2, 2);
  psylocke = new Player("psylocke", 8, 3.0);
  psylocke.setAnim("run", 6);
  frameRate(30);
  
  keys=new boolean[2];
  keys[0]=false;
  keys[1]=false;
}

void draw(){
  //println(frameRate);
  background(255);
  bg.display();
  fg.display();
  
  //mario.update();
  //mario.display();
  psylocke.update();
  psylocke.display();
  
}

void keyPressed()
{
  if(key=='d')
    keys[0]=true;
  if(key=='a')
    keys[1]=true;
}

void keyReleased()
{
  if(key=='d')
    keys[0]=false;
  if(key=='a')
    keys[1]=false;
} 