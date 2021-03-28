
class Paddle extends Base {
  boolean isAuto;

  Paddle() {
    super(200, 430, 40, 20, 5, color(0, 0, 100));
  }

  @Override void draw() {
    super.draw();

    if (isAuto && frameCount / 60 % 2 == 0) {
      textAlign(CENTER, CENTER);
      fill(15, 100, 100);
      textSize(32);
      text("DEMO", 0, 0, width, height);
      textAlign(BASELINE, BASELINE);
    }
  }

  void update() {
    if (isAuto) rect.x = int(ball.center.x) - rect.width / 2;
    else rect.x = mouseX - rect.width / 2;

    if (rect.x < 0) rect.x = 0;
    if (rect.x + rect.width > width) rect.x = width - rect.width;
  }

  @Override String getNote() {
    return "E6";
  }
}
