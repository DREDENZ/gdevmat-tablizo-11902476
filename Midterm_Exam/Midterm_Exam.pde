Walker blackhole = new Walker();
Walker[] matters = new Walker[100];
int frame = 0;

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080,720, P3D);
  frameRate(100);
  
  reset();
  blackhole.size = 50;
}

// [Clear all prior spawn points]
void reset()
{
  // [Clear Array]
  matters = new Walker[100];
  
  // [For Loop - New Matter]
  for(int i = 0; i < matters.length; i++)
  {
    // [Instantiate new matter]
    Walker matter = new Walker();
    matters[i] = matter;
    
    // [Create Random Spawn Point for Matter]
    float std = 150;
    float mean = 0;
    matters[i].position.x = std * randomGaussian() + mean;
    matters[i].position.y = std * randomGaussian() + mean;
    
    // [Render Matter of random size and color]
    matter.size = random(10, 45);
    color randomColor = color(random(255), random(255), random(255));
    matter.colorize = randomColor;
  }
  
  // [New Blackhole location]
  float blackholePosX = random(Window.left, Window.right);
  float blackholePosY = random(Window.bottom, Window.top);
  
  // [Locate Blackhole]
  blackhole.position.x = blackholePosX;
  blackhole.position.y = blackholePosY;
}

void draw()
{
  background(0);
  
  // [For Loop - for each matter in the array]
  for(int i = 0; i < matters.length; i++)
  {
    // [Render Matter]
    matters[i].render();
    
    // [Determine direction from blackhole & attract towards it]
    PVector direction = PVector.sub(blackhole.position, matters[i].position);
    matters[i].position.add(direction.normalize());
  }
  
  // [Render Blackhole]
  color white = color(255, 255, 255);
  blackhole.colorize = white;
  blackhole.render();
  
  // [Clear screen once all matter is in Blackhole]
  frame++;
  if(frame >= 610)
  {
    frame = 0;
    reset();
  }
  
  //for(int i = 0; i < matters.length; i++)
  //{
  //  if(matters[i].position == blackhole.position)
  //  {
  //    color black = color(0, 0, 0);
  //    matters[i].colorize = black;
  //    reset();
  //  }
  //}
  
}
