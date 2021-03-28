import ddf.minim.*;

final int row = 5;
final int col = 5;
final int blockHeight = 30;
final int blockOffset = 50;

Minim minim;
AudioOutput out;

Ball ball;
Paddle paddle;
Base wall;
Block[] blocks = new Block[row * col];

void setup() {
  size(600, 500);
  strokeWeight(2);
  colorMode(HSB, 100, 100, 100);

  minim = new Minim(this);
  out = minim.getLineOut();

  ball = new Ball();
  paddle = new Paddle();

  for (int i = 0; i < row * col; i++) {
    color c = color(i / col * 15, 100, 100);
    int x = (i % col) * width / col;
    int y = i / col * blockHeight + blockOffset;
    blocks[i] = new Block(x, y, width / col, blockHeight, c);
  }

  wall = new Base(0, 0, width, height, 0, 0) {
    @Override public void draw() {
    }
    @Override public boolean hitCheck(Ball ball) {
      // 下に落ちた判定
      //if (rect.height - ball.velocity.y <= ball.center.y) return false;
      return super.hitCheck(ball);
    }
    @Override public String getNote() {    
      return "G6";
    }
  };
}

void draw() {
  background(0);

  ball.update();
  paddle.update();

  hitCheck();

  for (Block b : blocks) {
    b.draw();
  }
  paddle.draw();
  ball.draw();
}

void hitCheck() {
  wall.hitCheck(ball);
  paddle.hitCheck(ball);

  for (Block b : blocks) {
    b.hitCheck(ball);
  }
}

void mouseClicked() {
  paddle.isAuto = !paddle.isAuto;
}
