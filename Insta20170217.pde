import java.util.*;

PImage img;
ArrayList<En> ens;
float noise_value;

void setup()
{
  size(512, 512);
  frameRate(30);
  colorMode(HSB);
  
  ens = new ArrayList<En>();
  noise_value = random(10);
  
  background(0);
}

void draw()
{
  //background(0);

  fill(color(0, 0, 0), 16);
  noStroke();
  rect(0, 0, width, height);
 
  if(noise(noise_value) >= 0.6)
  {
    ens.add(new En(50, random(360), random(25, 50), random(5, 10))); 
  }
  noise_value += 0.05;
 
  Iterator<En> it = ens.iterator();
  while(it.hasNext())
  {
    En e = it.next();
    e.run();
    if(e.isDead())
    {
      it.remove();
    }
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}