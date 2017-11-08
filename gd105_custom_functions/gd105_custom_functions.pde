void setup(){
 size(1024, 680); 
}

void draw(){
  if (keyPressed) {
    println(sixSidedDie());
  }
  
  println(roundMe(0.5));
}

int tenSidedDie(){
  int randomVal = int(random(0,6));
  return randomVal;
}
int sixSidedDie(){
  int randomVal = int(random(1,6.99999)); //we use 6.99, because of how int casting works (by dropping the numbers after the decimal, NOT by rounding
  return randomVal;
}

int roundMe(float unrounded){
  float castIntPlusHalf = int(unrounded) + 0.5;
  int rounded;
  if (unrounded >= castIntPlusHalf){
    rounded = int(unrounded) + 1;
  } else {
    rounded = int(unrounded);
  }
  return rounded;
}