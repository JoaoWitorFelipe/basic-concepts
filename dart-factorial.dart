int factorial(int n) => (n > 1) ? factorial(n - 1) * n : n;

void main() {
  print(factorial(7));
}
