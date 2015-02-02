

import ddf.minim.*;
import ddf.minim.analysis.*;


 //importar la libreria Minin
 //crear el objeto de tipo minim
 //se asocia el minin a un reproductor

Minim  cadena;
AudioPlayer rolas;
FFT fft;
boolean Tocar;
boolean Siguiente;
PImage play;
PImage stop;
PImage next;


int x = 40;
int y = 40;
int w = 40;
int h = 40;
int x1 = 100;



void setup(){
size(800,600);
background(255);
cadena= new Minim (this);
rolas = cadena.loadFile("Black Dog.mp3");
 play = loadImage("video-play-button.png");
 stop = loadImage("video-stop-button.png");
 next = loadImage("video-next-button.png");

 /////////////mixer///////////////////
 fft= new FFT( rolas.bufferSize(),rolas.sampleRate() );

}

void draw(){
  background(222,45,0);
  stroke(222,0,0);
   fill(0);
   image(play,40,40,40,40);
   //image(stop,40,40,40,40);
   image(next,100,40,40,40);
   //rect(,x,y,w,h);
  // rect(x1,y,w,h);
   /////////////mixer/////////////////////////////
   fft.forward(rolas.mix);
   for (int i= 0; i<fft.specSize();i++)
   line(i,height,i,height - fft.getBand(i)*8);
   
}


  void mousePressed(){
  if(mouseX>x && mouseX <x+y && mouseY>y && mouseY <y+w){
 Tocar=!Tocar;
 Siguiente=true;
   
  }else{
   
    Tocar=false;
    Siguiente=!Siguiente;
    image(stop,40,40,40,40);
   

  }
if (Tocar){
  play = loadImage("video-play-button.png");
   rolas.play();
   println("Play");
}else{
   stop = loadImage("video-stop-button.png");
   image(stop,40,40,40,40);
   rolas.pause();
   rolas.rewind();
   println("stop");

 if(Siguiente){
   play = loadImage("video-stop-button.png");
   rolas = cadena.loadFile("Black Dog.mp3");
   rolas.pause();
 }else{
  
   Tocar=!Tocar;
  rolas.skip(1000);
  rolas.rewind();
  rolas = cadena.loadFile("Good_Times_Bad_Times.mp3");
  rolas.play();
  println("siguiente");

 if(Siguiente){
 
  rolas = cadena.loadFile("Good_Times_Bad_Times.mp3");
  rolas.skip(1000);
  
 }
 }
 }
}


