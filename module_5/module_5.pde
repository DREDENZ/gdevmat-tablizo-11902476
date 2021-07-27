Walker[] myWalkers = new Walker[10];

PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);

void setup()
{
  size(1280,720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  spawn();
}

void draw()
{
  background(80);
  for(int i = 1; i < myWalkers.length; i++)
  {
    myWalkers[i].render();
    myWalkers[i].update();
    myWalkers[i].applyForce(wind);
    myWalkers[i].applyForce(gravity);
    bounce();
  }
}

void spawn()
{
  // create an array
  myWalkers = new Walker[10];
  
  // spawn 10 walkers
  for(int i = 0; i < myWalkers.length; i++)
  {
    Walker walker = new Walker();
    myWalkers[i] = walker;
    
    // colorize walkers
    color randomColor = color (random(256), random(256), random(256));
    walker.colorize = randomColor;
    
    // spawn walkers at (-500, 200)
    myWalkers[i].position.x = -500;
    myWalkers[i].position.y = 200;
    
    // walkers' mass and scale
    myWalkers[i].mass = i + 1;
    myWalkers[i].scale = myWalkers[i].mass * 15;
  }
}

void bounce()
{
  for(int i = 1; i < myWalkers.length; i++)
  {
    // make walker bounce on y axis
    if ((myWalkers[i].position.x > Window.right) || (myWalkers[i].position.x < Window.left))
    {
      myWalkers[i].velocity.x *= -1;
    }
    
    // make walker bounce on x axis
    if ((myWalkers[i].position.y > Window.top) || (myWalkers[i].position.y < Window.bottom))
    {
      myWalkers[i].velocity.y *= -1;
    }
  }
}
