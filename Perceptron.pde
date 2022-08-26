int sign(float n) {
  if (n >= 0)return 1;
  return -1;
}

class Perceptron {

  float weights[];
  float learningRate = 0.001;

  Perceptron() {
    this.weights = new float[2];

    for (int i = 0; i < weights.length; i++) {
      this.weights[i] = random(-1, 1);
    }
  }

  int guess(float inputs[]) {
    float sum = 0;
    for (int i = 0; i<this.weights.length; i++) {
      sum += inputs[i] * this.weights[i];
    }

    int output = sign(sum);
    return output;
  }
  void train(float[] inputs, int target) {
    int guess = guess(inputs);
    int error= target - guess;
    for (int i = 0; i < this.weights.length; i++) {
      this.weights[i] += inputs[i] * this.learningRate * error;
    }
  }
}
