Perceptron perceptron;

Point[] points = new Point[100];

void setup() {
  size(400, 400);
  float[] inputs = {1, -0.87};
  perceptron = new Perceptron();
  int guess = perceptron.guess(inputs);
  println(guess);

  for (int i = 0; i < points.length; i++) {
    points[i] = new Point();
  }
}

void draw() {
  background(255);
  for (Point p : points) {
    p.show();

    float[] inputs = {p.x, p.y};

    int guess = perceptron.guess(inputs);

    if (guess == p.label)
      fill(0, 255, 0);
    else
      fill(255, 0, 0);

    noStroke();
    ellipse(p.x, p.y, 8, 8);
  }
  stroke(0);
  line(0, 0, width, height);
}

void mousePressed() {
  for (Point p : points) {
    float[] inputs = {p.x, p.y};
    perceptron.train(inputs, p.label);
  }
}
