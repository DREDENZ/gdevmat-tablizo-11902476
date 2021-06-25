class Walker
{
  PVector position = new PVector();
  float size;
  color colorize;
  
  void render()
  {
    noStroke();
    fill(colorize);
    circle(position.x, position.y, size);
  }
}
