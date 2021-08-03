Walker[] walkers = new Walker[8];

void setup()
{
  size(1280,720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  int posY = 0;
  for (int i = 0; i < walkers.length; i++)
  {
    posY = 2 * (Window.h / 8) * (i - 4);
    walkers[i] = new Walker();
    walkers[i].position = new PVector(-500, posY);
    walkers[i].mass = 10 - i;
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].colorize = color (random(1, 256),random(1, 256), random(1, 256), random(1, 255));
  }
}

void draw()
{
  background(255);
  noStroke();
  
  strokeWeight(10);
  color black = color(0, 0, 0);
  fill(black);
  stroke(black);
  line(0, -360, 0, 360);
    
  float mew = 0.01f;
  for (Walker w : walkers)
  {
    if (w.position.x > 0)
    {
      mew = 0.04f; // modified coefficient of friction
    }
    println(mew);
    float normal = 1;
    float frictionMagnitude = mew * normal; // friction strength
    PVector friction = w.velocity.copy(); // .copy() - copies current velocity
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);
    
    // note: comment out either bonus or accelerate & corresponding applyForce to see effects
    PVector bonus = new PVector(0.2 * w.mass, 0);
    PVector accelerate = new PVector(0.2, 0);
    w.update();
    w.render();
    w.applyForce(bonus);
    w.applyForce(accelerate);
    
    if (w.position.x >= Window.right)
    {
      w.position.x = Window.right; // safeguard our position to not overflow toward the farther end of the edge
      w.velocity.x *= -1;
    }
    
    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom; // safeguard our position to not overflow toward the farther end of the edge
      w.velocity.y *= -1;
    }
  }  
}

void mouseClicked()
{
  setup();
}
