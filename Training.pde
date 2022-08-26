class Point {

  int label;
  float x, y;

  Point() {
    this.x = random(width);
    this.y = random(height);

    if (this.y > this.x)
      this.label = 1;
    else
      this.label = -1;
  }

  void show() {
    stroke(0);
    if (this.label == 1)
      fill(255);
    else
      fill(0);

    ellipse(this.x, this.y, 16, 16);
  }
}
