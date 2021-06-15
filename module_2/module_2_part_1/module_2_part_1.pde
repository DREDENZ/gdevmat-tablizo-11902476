void setup()
{
  size(1280,720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker randWalker = new Walker();
Walker biasWalker = new Walker();

void draw()
{
  rngWalker(); // calls randomWalk()
  destinedWalker(); // calls randomWalkBiased()
}

void rngWalker()
{
  randWalker.randomWalk();
  randWalker.render();
}

void destinedWalker()
{
  biasWalker.randomWalkBiased();
  biasWalker.render();
}
