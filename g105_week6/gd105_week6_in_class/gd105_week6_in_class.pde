
int howMany;

void setup(){
 size(1280,720);
 
 //use center mode so it doesnt draw the first one off-screen
 ellipseMode(CORNER);
 howMany = 5;
}

void draw(){
  
  //we use 'i' to iterate through our loop
  //we run the loop again as long as (i<howMany)
  //
  for ( int i = 0; i < howMany; i++ ) { 
    //how can we make howMany fit within the space of width...
     int size = width/howMany;
     int x = i * width/howMany; //space these out based on howMany
     int y =height/2 - size/2; //put it in the middle
     ellipse(x,y,size,size); 
  }
}