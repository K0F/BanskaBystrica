
class Otacejici_se_box {

  Bod pozice;
  color c = color(random(255),random(255),random(255));
  float rychlost;
  float velikost;
  float pruhlednost;
  
  Otacejici_se_box(float _x, float _y, float _z){
    pozice = new Bod(_x,_y,_z);
    
    rychlost = random(10,20);
    velikost = random(10,20);
    
    pruhlednost = 100;
  }

  void kresli() {
    stroke(c,pruhlednost); 
    noFill();
    
    pushMatrix();
    translate(pozice.x, pozice.y, pozice.z);

    rotateX(frameCount/rychlost);
    rotateY(frameCount/rychlost);
    
    box(velikost);

    popMatrix();
    
  }
}


class Bod {
  float x;
  float y;
  float z;

  Bod(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
  }
}

