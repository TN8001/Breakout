
abstract class Base {
  Rectangle rect;
  int cornerRadius;
  color c;

  Base(int x, int y, int width, int height, int cornerRadius, color c) {
    rect = new Rectangle(x, y, width, height);
    this.cornerRadius = cornerRadius;
    this.c = c;
  }

  void draw() {
    fill(c);
    rect(rect.x, rect.y, rect.width, rect.height, cornerRadius);
  }

   boolean hitCheck(Ball ball) {
    PVector p1 = ball.center;
    PVector p2 = PVector.add(ball.center, ball.velocity);

    if (rect.hitTop(p1, p2) || rect.hitBottom(p1, p2)) {
      ball.velocity.y *= -1;
      out.playNote(0, 0.2, getNote());
      return true;
    }
    if (rect.hitLeft(p1, p2) || rect.hitRight(p1, p2)) {
      ball.velocity.x *= -1;
      out.playNote(0, 0.2, getNote());
      return true;
    }

    return false;
  }
    
   String getNote() {
    return "C6";
  }
}
