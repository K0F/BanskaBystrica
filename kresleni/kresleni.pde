
PImage obrazek;
color c = color(random(255),random(255),random(255));

void setup(){
  
  size(1024,768);
  
  obrazek = loadImage("1.png");
  imageMode(CENTER);
  background(0);
  
  noCursor();
  
}


void draw(){
  
  
}

void mouseMoved(){
  
 pushMatrix();
  translate(mouseX,mouseY);
  rotate(atan2(mouseX-pmouseX,mouseY-pmouseY));
  
  tint(c,90);
  image(obrazek,0,0);
  
   popMatrix();
}
