

class Layer{
  PImage img;
  int order;
  int offset;
  
  Layer(String url, int layerNum){
    img = loadImage(url);
    order = layerNum + 1;
    offset = 0;
    img.resize(width, height);
  }
  
  void display(){   
    imageMode(CORNER);
    for ( int i = -2; i < 3; i++){
      image(img, offset + width * i, 0);
    }
  }
  
  void scroll(int amt){
      offset= offset + (amt * order);
      if (abs(offset) / width  > 1){
       offset = 0; 
      }
  }
  
}