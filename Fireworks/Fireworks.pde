PImage img;

ArrayList<Firework> fireworks;

PVector gravity = new PVector(0, 0.09);
//PVector gravity = new PVector(0, 0.2);
boolean disp = true;

void setup() 
{
  size(720, 720, P2D);
  
  img = loadImage("OpnS.png");
  img.resize(width,height);
  
  fireworks = new ArrayList<Firework>();
  //colorMode(HSB);
  background(0);
}

void keyPressed()
{
  if(key == 'd' || key == 'D')
  {
    disp = !disp;
  }
}
void draw() 
{
  if(disp)
  {
    //if (random(1) < 0.16) 
    //{
    //  fireworks.add(new Firework());
    //}
    for(int i=0; i<2; ++i)fireworks.add(new Firework());
    //fireworks.add(new Firework());
    //fill(255,50);
    fill(0,50);
    noStroke();
    rect(0,0,width,height);
    //background(255, 20);   
    for (int i = fireworks.size()-1; i >= 0; i--) 
    {
      Firework f = fireworks.get(i);
      f.run();
      if (f.done()) 
      {
        fireworks.remove(i);
      }
    }
    
    
    
  }
  
}
