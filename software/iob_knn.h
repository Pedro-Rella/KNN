#pragma once

#include <inttypes.h>

//Functions
void knn_reset();
void knn_start();
void knn_stop();
void knn_init(int base_address);
uint32_t knn_d2(short x1, short y1, short x2, short y2);
