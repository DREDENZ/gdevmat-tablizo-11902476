int frame = 1;
int limitCount = 1;

void setup()
{
  size(1280,720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  float gaussianCoordinate = randomGaussian();
  float randomCoordinate = random(-3.60, 3.60);
  
  float std = 100;
  float mean = 0;
  
  float x = std * gaussianCoordinate + mean;
  float y = std * randomCoordinate + mean;
  
  int red = int(random(0, 255));
  int green = int(random(0, 255));
  int blue = int(random(0, 255));
  color randomColor = color (red, green, blue);
  
  float gaussianCircle = randomGaussian();
  float circleStd = 10;
  float circleMean = 1;
  float randomCircle = circleStd * gaussianCircle + circleMean;
  
  noStroke();
  fill(randomColor, 70);
  circle(x, y, randomCircle);
  
  bonus();
}

void bonus()
{
  // Bonus
  int frameLimit = 300 * limitCount;
  frame++;
  println(frame); // counts current frame for checking
  if (frame == frameLimit)
  {
    background(255);
    limitCount++;
  }
}
