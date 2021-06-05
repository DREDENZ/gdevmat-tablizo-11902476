public class Walker
{
  public float x, y;
  public float tx = 0, ty = 10000;
  public float tRed = 255, tGreen = 150, tBlue = 200;
  public float tThick;
  
  void render()
  {
    // perlin colors
    int red = int(map(noise(tRed), 0, 1, 0, 255));
    int green = int(map(noise(tGreen), 0, 1, 0, 255));
    int blue = int(map(noise(tBlue), 0, 1, 0, 255));
    color coloredWalker = color (red, green, blue);
    
    println(red, green, blue);
    
    // perlin thickness
    int thickness = int(map(noise(tThick), 0, 1, 5, 150));
    
    fill(coloredWalker);
    noStroke();
    circle (x, y, thickness);
    
    tRed += 0.01f;
    tGreen += 0.01f;
    tBlue += 0.01f;
    tThick += 0.01f;
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.001f;
    ty += 0.001f;
  }
}
