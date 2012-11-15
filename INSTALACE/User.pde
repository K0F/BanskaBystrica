
class User {
  PVector pos, lpos, spos;
  String ip;
  color c; 
  PImage stetec;

  User(String _ip) {

    ip = _ip;
    rand(); 
   }


  void draw() {
    if(frameCount%1000==0){
     rand(); 
    }
    
    pushMatrix();
    translate(spos.x, spos.y);
    rotate(atan2(pos.x-spos.x, pos.x-spos.x));

    tint(c, 90);
    image(stetec, 0, 0);
  
    popMatrix();
    
    lpos = new PVector(spos.x,spos.y);
    spos.x += (pos.x-spos.x)/5.0;//
    spos.y += (pos.y-spos.y)/5.0;//
    
    //new PVector(,(pos.y-spos.y)/5.0 );
  }
  
  
  void rand(){
     pos = new PVector(width/2,height/2);
    lpos = new PVector(width/2,height/2);
    spos = new PVector(width/2,height/2);

    c = color(random(127,255), random(127,255), random(127,255));

    String filename = (String)f.get((int)random(f.size()));
    println(ip + " " + filename);
    stetec = loadImage(filename);
  
    fill(0,15);
    noStroke();
    rect(0,0,width,height);
  }
  
  void setPos(float _x, float _y){
    
    pos = new PVector(map(_x,0,1,0,width),map(_y,0,1,0,height));
  //println(_x);    
  }
}

