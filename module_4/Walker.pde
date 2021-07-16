public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;  
  public float size = 15;
  
  public Walker()
  {
    
  }
  
  //public void update()
  //{
  //  this.acceleration = mousePos();
  //  this.velocity.add(this.acceleration);
  //  this.velocity.limit(velocityLimit); // limits to the max value inserted
  //  this.position.add(this.velocity);
  //}
  
  public void render()
  {
    circle(position.x, position.y, size);
  }
  
}
