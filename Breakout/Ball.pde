
class Ball {
  PVector center = new PVector(100, 250);
  PVector velocity = new PVector(5, 6);
  int radius = 5;
  color c = color(0, 0, 100);


  void update() {
    center.add(velocity);
  }

  void draw() {
    fill(c);
    ellipseMode(RADIUS);
    circle(center.x, center.y, radius);
    ellipseMode(CENTER);
  }
}
