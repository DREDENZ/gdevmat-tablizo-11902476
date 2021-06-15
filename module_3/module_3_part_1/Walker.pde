class Walker
{
  // position and speed vectors
  PVector position = new PVector();
  PVector speed = new PVector(5, 8);
  
  // render walker
  void render()
  {
    // random RGB generator
    int red = int(random(75, 255));
    int green = int(random(75, 200));
    int blue = int(random(75, 225));
    color coloredWalker = color (red, green, blue);
    
    // walker's sprite in display
    if ((position.y > Window.top) || (position.y < Window.bottom) || (position.x > Window.right) || (position.x < Window.left))
      fill(coloredWalker); // changes color when through bouncing
    
    noStroke();
    circle(position.x, position.y, 30);
  }
  
  // walker's movement and bounce function
  void moveAndBounce()
  {
    // walker's movement
    position.add(speed);
    
    // make walker bounce on y axis
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
    }
    
    // make walker bounce on x axis
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
    }
    
  }
  
}
