
import processing.net.*;

//////////////////////////////////////////////

ArrayList uzivatele;

Server s;
String data;

String path = "/home/kof/sketchBook/Lekce/INSTALACE/data/";
ArrayList f;

int counter = 0;
int textLine = 0;


//////////////////////////////////////////////

void setup() {
  size(1600,900);
  background(0);
  fill(200);
  frameRate(25);
  s = new Server(this, 10000); // Connect to server on port 80

    uzivatele = new ArrayList();

  f = getNew();
  println(f);
  
  imageMode(CENTER);
  noCursor();
}

///////////////////////////////////////////////


void draw() {

  for(int i = 0 ; i < uzivatele.size();i++){
    User tmp = (User)uzivatele.get(i);
   tmp.draw(); 
    
  }


  try{
  refresh();
  }catch(Exception e){;}
  
  fill((sin(frameCount/5.0)+1.0)*127);
  noStroke();
  rect(width-30,30,3,3);
  
  if(frameCount%3000==0){
   saveFrame("/home/kof/render/BB/screencap#####.tga"); 
  }
  
  //noTint();
  //image(g,width/2,height/2+1);
}

///////////////////////////////////////////////


void refresh() {

  try {

    Client thisClient = s.available();
    if (thisClient != null) {
      if (thisClient.available() > 0) {
        //text("mesage from: " + thisClient.ip() + " : " + thisClient.readString(), 15, 0);
        //textLine = textLine + 35;

        String adresa = thisClient.ip();

        boolean existuje = false;

        if(uzivatele.size()==0)
        existuje = false;
        
        for (int i = 0 ; i < uzivatele.size(); i ++) {
          User tmp = (User)uzivatele.get(i);
          if (tmp.ip.equals(adresa))
            existuje = true;
        }


        String input  = thisClient.readString();
        //println(input);
        String parse1[] = splitTokens(input, "\r\n");
        String parse2[] = splitTokens(parse1[0], "/? &xy=");
        // println(parse2[1] + " " + parse2[2]);

        float x = parseFloat(parse2[1]);
        float y = parseFloat(parse2[2]);



        //jestlize existuje pohni s jeho kurzorem
        //jestlize ne zaloz noveho uzivatele

        if (!existuje) {
          uzivatele.add(new User(adresa));
        } 
        else {

          for (int i = 0 ; i < uzivatele.size();i++) {
            User tmp = (User)uzivatele.get(i);
            if (tmp.ip.equals(adresa)) {
              tmp.setPos(x, y);
            }
          }          
        }// else 
      }
    }
  }
  catch(Exception e) {
    ;
  }
}

///////////////////////////////////////////////

