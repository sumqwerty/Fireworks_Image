class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  boolean seed = false;

  float hu;

  Particle(float x, float y, float h) {
    hu = h;

    acceleration = new PVector(0, 0);
    velocity = new PVector(0,random(-11, -2));
    location =  new PVector(x, y);
    seed = true;
    lifespan = 255.0;
  }

  Particle(PVector l, float h) {
    hu = h;
    acceleration = new PVector(0, 0);
    //velocity = new PVector(1,0);
    velocity = PVector.random2D();
    velocity.mult(random(4, 8));
    location = l.copy();
    lifespan = 255.0;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void run() {
    update();
    display();
  }

  boolean explode() {
    if (seed && velocity.y > 0) {
      lifespan = 0;
      return true;
    }
    return false;
  }

  // Method to update location
  void update() {

    velocity.add(acceleration);
    location.add(velocity);
    if (!seed) {
      lifespan -= 5.0;
      velocity.mult(0.95);
    }
    acceleration.mult(0);
  }

  // Method to display
  void display() {
    //println(location);
    int loc;
    int x = int(location.x);
    int y = int(location.y);
    //stroke(hu, 0, 255, lifespan);
    
    img.loadPixels();
    if((x < img.width-1) && (x > 1) && (y < img.height-1) && (y > 1))
    {
      loc = int(x+y*img.width);
      //stroke(hu, 255, 255, lifespan);
      //println(loc < (width*height));
    }
    else loc = 0;
    //loc = int(location.x+location.y*img.width);
    //println(loc);
    //if(loc > img.pixels.length)loc = loc-2;
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    //stroke(hu, 255, 255, lifespan);
    stroke(r, g, b, lifespan);
    if (seed) {
      strokeWeight(4);
    } else {
      strokeWeight(2);
    }
    point(location.x, location.y);
    //ellipse(location.x, location.y, 2, 2);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
