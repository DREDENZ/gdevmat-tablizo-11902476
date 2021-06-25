void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080,720, P3D);
}

PVector mousePos() // function that determines the mouse's location on the screen
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(130);  
  // proper-sided
  outer1();
  inner1();
  handle1();
  
  // opposite-sided
  outer2();
  inner2();
  handle2();
  
}

void handle1()
{
  strokeWeight(11); // thickeness of line
  stroke(0, 0, 0); // color of line (RGB)
  
  PVector mouse = mousePos();
  
  mouse.normalize().mult(50);
  line(0, 0, mouse.x, mouse.y);
}

void handle2()
{
  strokeWeight(11); // thickeness of line
  stroke(0, 0, 0); // color of line (RGB)
  
  PVector mouse = mousePos();
  
  mouse.normalize().mult(-50);
  line(0, 0, mouse.x, mouse.y);
}

void outer1()
{
  strokeWeight(13); // thickeness of line
  stroke(255, 0, 0); // color of line (RGB)
  
  PVector mouse = mousePos();
  
  mouse.normalize().mult(250);
  line(0, 0, mouse.x, mouse.y);
  
  println(mouse.mag()); // prints the mouse's magnitude (length of the line)
}

void outer2()
{
  strokeWeight(13); // thickeness of line
  stroke(255, 0, 0); // color of line (RGB)
  
  PVector mouse = mousePos();
  
  mouse.normalize().mult(-250);
  line(0, 0, mouse.x, mouse.y);
}

void inner1()
{
  strokeWeight(7); // thickeness of line
  stroke(255, 255, 255); // color of line (RGB)
  
  PVector mouse = mousePos();
  
  mouse.normalize().mult(250);
  line(0, 0, mouse.x, mouse.y);
}

void inner2()
{
  strokeWeight(7); // thickeness of line
  stroke(255, 255, 255); // color of line (RGB)
  
  PVector mouse = mousePos();
  
  mouse.normalize().mult(-250);
  line(0, 0, mouse.x, mouse.y);
}
