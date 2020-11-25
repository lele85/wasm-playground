#include "env.h"

// https://aransentin.github.io/cwasm/
int add(int a, int b) {
  logjs(a + b);
  return a + b;
}

int sub(int a, int b) {
  logjs(a - b);
  return a - b;
}