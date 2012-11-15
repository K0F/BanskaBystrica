


int pocet = 1000;
Otacejici_se_box prvni[];

void setup() {
  size(320, 320, P3D);

  prvni = new Otacejici_se_box[pocet];
  
  for(int i = 0 ; i < prvni.length;i++){
   prvni[i] =  new Otacejici_se_box(random(0,width),random(0,height),-random(0,width));
  }
}

void draw() {
  background(0);
  
 // prvni[2].pozice.x = frameCount%width;
 
  for(int i = 0 ; i < prvni.length;i++){
    prvni[i].kresli();
  
  }
}

