int sign(float n) {
  if (n >= 0)return 1;
  return -1;
}

class Perceptron {

  float weights[];
  float learningRate = 0.001;

  Perceptron(int n) {
    this.weights = new float[n];

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

  float guessY(float x) {
    float wx = this.weights[0];
    float wy = this.weights[1];
    float wb = this.weights[2];

    return -(wb/wy) - (wx/wy) * x;
  }

  void train(float[] inputs, int target) {
    int guess = guess(inputs);
    int error= target - guess;
    for (int i = 0; i < this.weights.length; i++) {
      this.weights[i] += inputs[i] * this.learningRate * error;
    }
  }
}
