float time = 0.0;
float dt = 0.1f;

void setup()
{
  size(1280,720, P3D); // set window size (1280 x 720)
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);// set camera postion (middle of the window)
  frameRate(4);
}

void draw()
{
   background(130); // set background color (130 = light gray; 0 = black) of the whole window
   
   drawCartesianPlane();
   //drawQuadraticFunction();
   ///drawLinearFunction();
   drawSineWave();
   //drawMovingSineWave();
}

void drawCartesianPlane()
{
  // [DRAW A CARTESIAN PLANE]
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  // [DRAWING LINES FOR X & Y AXIS]
  // use a for-loop for ease of application
  for (int i = -300; i <= 300; i+=10) // i is equal to -300(minimum value), with a line every 10 points till 300(maximum value)
  {
    line(i, -2, i, 2); // adds tiny lines with a thickness of 4 on x-axis
    line(-2, i, 2, i); // adds tiny lines with a thickness of 4 on y axis
  }
}

void drawQuadraticFunction()
{
  // [1. f(x) = x2−15x−3 (yellow color)]
  color yellow = color(0, 255, 255);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x, ((float)Math.pow(x, 2) - (x * 15) - 3), 5); // Math.pow(base, exponent) turns data type to double(accepts decimals) therefore has to be typecasted; x * x is also applicable
  }
}

void drawLinearFunction()
{
  // [2. f(x) =−5x +30 (purple color)]
  color purple = color(255, 0, 255);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, ((-5 * x) + 30), 5);
  }
}

void drawSineWave()
{
  // [3. Sine Wave (any color of your choosing)]
  color green = color(0, 255, 0);
  fill(green);
  stroke(green);
  
  float amp = 30;
  float freq = 20;
  // formula reference: https://www.purplemath.com/modules/grphtrig.htm  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, amp *((float)Math.sin(x/freq)), 5);
  }
}

// Bonus
void drawMovingSineWave()
{
  color black = color(0, 0, 0);
  fill(black);
  stroke(black);
  
  float amp = 50;
  float freq = 10;
  // formula reference: https://www.purplemath.com/modules/grphtrig.htm (A*sin(f * t + x))
  // formula reference: https://www.youtube.com/watch?v=4v2NkbUJEks
  for (int x = -200; x <= 200; x++)
  {
    circle(x, (amp * ((float)Math.sin((freq * (time + x)/amp)/2))), 5);
    time += dt;
  }
  
}
