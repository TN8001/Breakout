
class Block extends Base {
  boolean isDead;

  Block(int x, int y, int w, int h, color c) {
    super(x, y, w, h, 4, c);
  }

  @Override void draw() {
    if (isDead) return;
    super.draw();
  }

  @Override boolean hitCheck(Ball ball) {
    if (isDead) return false;
    return isDead = super.hitCheck(ball);
  }
}
