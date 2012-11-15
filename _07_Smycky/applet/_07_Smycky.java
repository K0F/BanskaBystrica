import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class _07_Smycky extends PApplet {
public void setup(){
 size(100,100); 
}

int X,Y;

public void draw(){  
  X = mouseX;
  Y = mouseY;
  
  for(int x = 0; x < width ; x+=5 ){
    for(int y = 0; y < height ; y+=5 ){
      stroke( map(dist(X,Y,x,y),0,100,0,255) ); //pseudonahodne cislo od 0..255 - pro kazdy pixel jina barevna (cernobila) hodnota
      point(x,y); // na kazde pozici udelej bod
    } 
  }
  
}





  static public void main(String args[]) {     PApplet.main(new String[] { "_07_Smycky" });  }}