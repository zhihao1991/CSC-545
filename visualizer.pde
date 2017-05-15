import ddf.minim.*;

Minim minim;
AudioPlayer player;

boolean started; //boolean for telling if the program has started 

void setup() {
  
  size(1000, 800, P2D);
  
  minim = new Minim(this);
  player = minim.loadFile("Demons.mp3",2048);
  player.play();
  
}

void draw() {
  background(0);
  stroke(255);

  strokeWeight(2);
  float a = 0;
  float angle = (2*PI) / 200;
  int step = player.bufferSize() / 200;
  for(int i=0; i < player.bufferSize() - step; i+=step) {
    float x = 500 + cos(a) * (800 * player.mix.get(i) + 100);
    float y = 400 + sin(a) * (800 * player.mix.get(i) + 100);
    float x2 = 500 + cos(a + angle) * (800 * player.mix.get(i+step) + 100);
    float y2 = 400 + sin(a + angle) * (800 * player.mix.get(i+step) + 100);
    line(x,y,x2,y2);
    a += angle;
  }

}

void keyPressed()
{
  if(key == ESC)
  {
    started = false; //kills the program 
    player.pause();
  }
}
  

void close()
{
  player.close();
  minim.stop();
  super.stop();
}