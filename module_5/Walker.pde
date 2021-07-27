public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;  
  public float scale = 15;
  
  public float mass = 1;
  public color colorize;
  
  public Walker()
  {
    
  }
  
  // Newton's Second Law of Motion
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // force accumulation
  }
  
  public void update()
  {
    //this.acceleration = PVector.random2D(); // generates a random vector
    this.velocity.add(this.acceleration); // velocity accumulation
    this.velocity.limit(velocityLimit); // limits to the max value inserted
    this.position.add(this.velocity);
    this.acceleration.mult(0); // reset acceleration every frame
  }
  
  public void render()
  {
    stroke(color (0, 0, 0));
    fill(colorize);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    // Check X Axis
    if(this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if(this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    // Check Y Axis
    if(this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if(this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
}
