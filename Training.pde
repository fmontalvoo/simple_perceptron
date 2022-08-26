float f(float x){
  // f(x) = mx + b
  return 0.21*x + 0.14;
}


class Point {

  int label;
  float x, y;
  float bias = 1;

  Point() {
    this.x = random(-1, 1);
    this.y = random(-1, 1);

    float y_ = f(this.x);
    if (this.y > y_)
      this.label = 1;
    else
      this.label = -1;
  }
  
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }

  float pointX() {
    return map(this.x, -1, 1, 0, width);
  }

  float pointY() {
    return map(this.y, -1, 1, height, 0);
  }

  void show() {
    stroke(0);
    if (this.label == 1)
      fill(255);
    else
      fill(0);

    float px = this.pointX();
    float py = this.pointY();
    ellipse(px, py, 16, 16);
  }
}
