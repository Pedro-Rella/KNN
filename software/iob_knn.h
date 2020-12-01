#pragma once

#include <inttypes.h>

//Functions
void knn_reset();
void knn_start();
void knn_stop();
void knn_init(int base_address);
uint64_t knn_d2(int x1, int y1, int x2, int y2);
