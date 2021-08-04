Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.01f);
Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.1, 0);

void setup()
{
  size(1280,720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  int posX = 0;
  for (int i = 0; i < walkers.length; i++)
  {
    posX = 2 * (Window.w / 10) * (i - 5);
    walkers[i] = new Walker();
    walkers[i].position = new PVector(posX, 200);
    walkers[i].mass = 10 - i;
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].colorize = color (random(1, 255),random(1, 255), random(1, 255), random(1, 255));
  }
}

void draw()
{
  background(255);
  noStroke();
  
  ocean.render();
  
  for (Walker w : walkers)
  {
    float mew = 0.01f; // coefficient of friction
    float normal = 1;
    float frictionMagnitude = mew * normal; // friction strength
    PVector friction = w.velocity.copy(); // .copy() - copies current velocity
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction); // apply friction to walker
    
    PVector gravity = new PVector(0, -0.15 * w.mass); // apply gravity to walker
    
    w.update();
    w.render();
    w.applyForce(wind);
    w.applyForce(gravity);
    
    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce); // apply drag force to walker
    }
    
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
