import processing.core.PVector;


class Rectangle {
  int x;
  int y;
  int width;
  int height;

  Rectangle(int x, int y, int width, int height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  void translate(PVector p) {
    x += p.x;
    y += p.y;
  }

  boolean hitTop(PVector p1, PVector p2) {
    PVector p3 = new PVector(x, y);
    PVector p4 = new PVector(x + width, y);
    return intersection(p1, p2, p3, p4);
  }

  boolean hitBottom(PVector p1, PVector p2) {
    PVector p3 = new PVector(x, y + height);
    PVector p4 = new PVector(x + width, y + height);
    return intersection(p1, p2, p3, p4);
  }

  boolean hitLeft(PVector p1, PVector p2) {
    PVector p3 = new PVector(x, y);
    PVector p4 = new PVector(x, y + height);
    return intersection(p1, p2, p3, p4);
  }

  boolean hitRight(PVector p1, PVector p2) {
    PVector p3 = new PVector(x + width, y);
    PVector p4 = new PVector(x + width, y + height);
    return intersection(p1, p2, p3, p4);
  }

  private boolean intersection(PVector a, PVector b, PVector c, PVector d) {
    PVector ab = PVector.sub(b, a);
    PVector ac = PVector.sub(c, a);
    PVector ad = PVector.sub(d, a);
    float d1 = ab.cross(ac).z;
    float d2 = ab.cross(ad).z;
    if (d1 * d2 > 0.0f) return false;

    PVector cd = PVector.sub(d, c);
    PVector ca = PVector.sub(a, c);
    PVector cb = PVector.sub(b, c);
    float d3 = cd.cross(ca).z;
    float d4 = cd.cross(cb).z;
    if (d3 * d4 > 0.0f) return false;

    return true;
  }

  private boolean intersection2(PVector a, PVector b, PVector c, PVector d) {
    if (((a.x - b.x) * (c.y - a.y) + (a.y - b.y) * (a.x - c.x)) *
      ((a.x - b.x) * (d.y - a.y) + (a.y - b.y) * (a.x - d.x)) <= 0) {
      if (((c.x - d.x) * (a.y - c.y) + (c.y - d.y) * (c.x - a.x)) *
        ((c.x - d.x) * (b.y - c.y) + (c.y - d.y) * (c.x - b.x)) <=0) {
        return true;
      }
    }
    return false;
  }
}
