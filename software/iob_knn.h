#pragma once

#include <inttypes.h>

//labeled dataset
struct datum {
  short x;
  short y;
  short label;
} data[N], x[M];

//Functions
void knn_reset();
void knn_init(int base_address);
short knn(short x, short y, struct datum*);
