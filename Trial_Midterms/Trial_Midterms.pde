Walker blackhole = new Walker();
Walker matter = new Walker();
Walker[] matters = new Walker[100];

int frame = 1;
int limitCounter = 1;

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080,720, P3D);
  
  frameRate(1);
  
  //blackholeLocate();
}

void draw()
{
  background(0);
  
  // [Display located blackhole]
  blackhole.renderBlackhole();
  
  for(int i = 0; i < matters.length; i++)
  {
    // [Locate then Generate matter]
    locateMatter();
    
    // [Spawn matter]
    matters[i].renderMatter();
    
    // [Attract Matter towards blackhole]
    attract();
    
    // [Flush screen after number of max limit]
    if (blackhole.position == matters[i].position)
    {
      background(0);
      //locateMatter();
      //blackholeLocate();
    }
    
  }
  
}

void blackholeLocate()
{
  // [Randomize Blackhole Location]
    float blackholePosX = random(Window.left, Window.right);
    float blackholePosY = random(Window.bottom, Window.top);
  
    // [Locate Blackhole]
    blackhole.position.x = blackholePosX;
    blackhole.position.y = blackholePosY;
}

void locateMatter()
{
  // [Display Matter]
  for(int i = 0; i < matters.length; i++)
  {
    // [Insert Matter into Array]
    matters[i] = matter;
    
    // [Randomize Matter Location & Locate Matter]
    float std = 300;
    float mean = 0;
    matters[i].position.x = std * randomGaussian() + mean;
    matters[i].position.y = std * randomGaussian() + mean;
    
    // [Render Matter]
    //matters[i].renderMatter();
  }
}

void attract()
{
  for (int i = 0; i < matters.length; i++)
  {
    // [Get Direction]
    PVector direction = PVector.sub(blackhole.position, matters[i].position);
    
    // [Normalize & Move towards the direction]
    matters[i].position.add(direction.normalize());
  }
}
