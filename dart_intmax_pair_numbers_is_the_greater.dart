int takeGreaterNumber(int y, int z) => y.compareTo(z) == -1 ? z : y;

void main() {
  print(takeGreaterNumber(100, 10));
}
