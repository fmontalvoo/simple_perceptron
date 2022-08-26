Perceptron perceptron;

Point[] points = new Point[100];

void setup() {
  size(400, 400);
  
  perceptron = new Perceptron(3);

  for (int i = 0; i < points.length; i++) {
    points[i] = new Point();
  }
}

void draw() {
  background(255);
  for (Point p : points) {
    p.show();

    float[] inputs = {p.x, p.y, p.bias};

    int guess = perceptron.guess(inputs);

    if (guess == p.label)
      fill(0, 255, 0);
    else
      fill(255, 0, 0);

    noStroke();
    ellipse(p.pointX(), p.pointY(), 8, 8);
  }
  stroke(0);

  float x1 = -1;
  float y1 = f(x1);
  Point p1 = new Point(x1, y1);

  float x2 = 1;
  float y2 = f(x2);
  Point p2 = new Point(x2, y2);

  line(p1.pointX(), p1.pointY(), p2.pointX(), p2.pointY());

  Point p3 = new Point(-1, perceptron.guessY(-1));
  Point p4 = new Point(1, perceptron.guessY(1));
  
  line(p3.pointX(), p3.pointY(), p4.pointX(), p4.pointY());
}

void mousePressed() {
  for (Point p : points) {
    float[] inputs = {p.x, p.y, p.bias};
    perceptron.train(inputs, p.label);
  }
}
