class Walker
{
  // Walker Coordinates
  float x;
  float y;
  
  // Walker Visual
   void render()
  {
    // random RGB generator
    int red = int(random(50, 100));
    int green = int(random(50, 100));
    int blue = int(random(50, 100));
    color coloredWalker = color (red, green, blue);
    
    // walker's sprite in display
    fill(coloredWalker);
    noStroke();
    circle(x, y, 30);
  }
  
  // Walker's random movement
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0) // north
      y+=10;
    else if (rng == 1) // south
      y-=10;
    else if (rng == 2) // east
      x+=10;
    else if (rng == 3) // west
      x-=10;
    else if (rng == 4) // north-east
      {
        y+=10;
        x+=10;
      }
    else if (rng == 5) // north-west
      {
        y+=10;
        x-=10;
      }
    else if (rng == 6) // south-east
      {
        y-=10;
        x+=10;
      }
    else if (rng == 7) // south-west
      {
        y-=10;
        x-=10;
      }
  }
  
  
  // Walker's biased random movement
  // bias ratio distribution [4 : 14 : 15 : 7 : 16 : 6 : 13 : 5]
  // north : south : east : west : north-east : north-west : south-east : south-west
  void randomWalkBiased()
  {
    int rng = int(random(79));
    
    if (rng <= 3) // north
      y+=10;
    else if (rng >= 4 && rng <= 17) // south
      y-=10;
    else if (rng >= 18 && rng <= 32) // east
      x+=10;
    else if (rng >= 33 && rng <= 39) // west
      x-=10;
    else if (rng >= 40 && rng <= 55) // north-east
      {
        y+=10;
        x+=10;
      }
    else if (rng >= 56 && rng <= 61) // north-west
      {
        y+=10;
        x-=10;
      }
    else if (rng >= 62 && rng <= 74) // south-east
      {
        y-=10;
        x+=10;
      }
    else if (rng >= 75 && rng <= 79) // south-west
      {
        y-=10;
        x-=10;
      }
  }
}
