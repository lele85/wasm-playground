// https://aransentin.github.io/cwasm/

int logjs( int n );

int add(int a, int b) {
  logjs(a + b);
  return a + b;
}

int sub(int a, int b) {
    return a - b;
}