import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(800, 600, P2D);
  
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
    float x = 400 + cos(a) * (1000 * player.mix.get(i) + 150);
    float y = 300 + sin(a) * (1000 * player.mix.get(i) + 150);
    float x2 = 400 + cos(a + angle) * (1000 * player.mix.get(i+step) + 150);
    float y2 = 300 + sin(a + angle) * (1000 * player.mix.get(i+step) + 150);
    line(x,y,x2,y2);
    a += angle;
  }

}

void pauseAndPlay()
{
  if(key == 'p')
  {
    player.pause();
  }
  else if(key == 's')
  {
    player.play();
  }
  
}
void close()
{
  player.close();
  minim.stop();
  super.stop();
}