

ArrayList x,y;

int delka = 500;

void setup(){
 
 size(1024,768);

 x = new ArrayList(); 
 y = new ArrayList(); 
  
  
 mouseX = width/2;
 mouseY = height/2;
}


void draw(){
  
  background(0);
  
  
  x.add(mouseX);
  y.add(mouseY);
  
  stroke(255);
  
  for(int i = 1; i < x.size();i++){
    float X1 = (Integer)x.get(i);
    float Y1 = (Integer)y.get(i);
    
    float X2 = (Integer)x.get(i-1);
    float Y2 = (Integer)y.get(i-1);
    
    stroke(255,map(i,0,delka,0,255));
    
    line(X1,Y1,X2,Y2);
  }
  
  if(x.size()>delka){
   x.remove(0);
   y.remove(0);  
  }  
}
