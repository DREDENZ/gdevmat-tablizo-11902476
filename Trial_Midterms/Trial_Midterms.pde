Walker blackhole = new Walker();
Walker matter = new Walker();
Walker[] matters = new Walker[100];

int frame = 1;
int limitCounter = 1;

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080,720, P3D);
  
  //frameRate(1);
  
  //blackholeLocate();
}

void draw()
{
  background(0);
  
  // [Display located blackhole]
  //blackhole.renderBlackhole();
    
  for(int i = 0; i < matters.length; i++)
  {
    // [Locate then Generate matter]
    locateMatter();
    matters[i].renderMatter();
  }
  
  // [Attract Matter towards blackhole]
  //attract();
  
  // [Flush screen after number of max limit]
  int maxLimit = 200;
  int frameLimit = maxLimit * limitCounter;
  frame++;
  if (frame == frameLimit)
  {
    background(0);
    //blackholeLocate();
    limitCounter++;
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
  // [Randomize Matter Location]
  //float matterPosX = 100 * randomGaussian() + 0;
  //float matterPosY = 100* randomGaussian() + 0;
  //float gaussianNum = 10 * randomGaussian() + 0;
  //PVector matterPos = PVector.mult(matter.position, gaussianNum);
  
  
  // [Display Matter]
  for(int i = 0; i < matters.length; i++)
  {
    // [Insert Matter into Array]
    matters[i] = matter;
    
    // [Locate Matter]
    //matters[i].position.x = matterPos.x;
    //matters[i].position.y = matterPos.y;
    matters[i].position.x = randomGaussian();
    matters[i].position.y = randomGaussian();
    
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
