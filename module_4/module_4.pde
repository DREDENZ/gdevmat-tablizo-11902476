Walker[] myWalkers = new Walker[100];

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280,720, P3D);
  spawn();
}

PVector mousePos() // function that determines the mouse's location on the screen
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void spawn()
{
  // Create Array
  myWalkers = new Walker[100];
  
  // Spawn 100 myWalkers
  for (int i = 0; i < myWalkers.length; i++)
  {
    // Instatiate myWalkers
    Walker myWalker = new Walker();
    myWalkers[i] = myWalker;
    
    // Randomly Spawn myWalkers
    myWalkers[i].position.x = random(400);
    myWalkers[i].position.y = random(400);
    
    // Adjust myWalkers' size
    myWalker.size = random(50);
  }
  
}

void draw()
{
  background(80);
  
   for (int i = 0; i < myWalkers.length; i++)
  {
    // Update Mouse location & attract
    PVector direction = PVector.sub(mousePos(), myWalkers[i].position);
    myWalkers[i].position.add(direction.normalize());
    myWalkers[i].acceleration = PVector.mult(direction, 0.2);
    
    //Render myWalkers
    myWalkers[i].render();    
  }
}
