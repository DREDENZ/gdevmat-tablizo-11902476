class Walker
{
  PVector position = new PVector();
  
  // render Blackhole
  void renderBlackhole()
  {
    noStroke();
    fill(255, 255, 255);
    circle(position.x, position.y, 50);
  }
  
  // render Matter
  void renderMatter()
  {
    // [Create Matter Visuals]
  int red = int(random(0, 255));
  int green = int(random(0, 255));
  int blue = int(random(0, 255));
  color randomColor = color (red, green, blue, 90);
  
  noStroke();
  fill(randomColor);
  circle(position.x, position.y, random(10, 90));
  }
  
}
