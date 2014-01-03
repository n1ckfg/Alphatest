// http://processing.org/discourse/beta/num_1191532471.html

PImage img;
PGraphics alphaImg;

void setup(){
  img = loadImage("test.png");
  size(img.width*10,img.height*10); 
  // create a pgraphics object for rendering on a transparent background 
  alphaImg = createGraphics(width,height);
}

void draw() {
  background(0);
  
  // draw into the pgraphics object
  alphaImg.beginDraw();
  // make sure its alpha is set to 0
  alphaImg.loadPixels();
  for(int i=0;i<alphaImg.pixels.length;i++){
    alphaImg.pixels[i] = color(0,0);
  }
  alphaImg.updatePixels();
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  for(int i=0;i<100;i++){
    //alphaImg.image(img,0,0);
    alphaImg.image(img,random(width),random(height));
  }
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  alphaImg.endDraw();
 
  // draw the second renderer into the window, so we can see something 
  image(alphaImg, 0,0);
}

void keyPressed(){
  alphaImg.save("alphatest.png"); 
  println("alphatest.png saved.");
}
