int addOne(int n) => n += 1;

int addManyTimes(int n, int times) =>
    times > 0 ? addManyTimes(addOne(n), --times) : n;

void main() {
  print(addManyTimes(1, 2));
}
