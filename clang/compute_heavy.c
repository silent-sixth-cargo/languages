#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>

uint64_t matrix_determinant(uint64_t size) {
    uint64_t n = size + 2;
    uint64_t **matrix = malloc(n * sizeof(uint64_t*));
    for (uint64_t i = 0; i < n; i++) {
        matrix[i] = malloc(n * sizeof(uint64_t));
    }
    
    for (uint64_t i = 0; i < n; i++) {
        for (uint64_t j = 0; j < n; j++) {
            matrix[i][j] = (i * j + 1) % 1000;
        }
    }
    
    uint64_t det = 1;
    for (uint64_t i = 0; i < n; i++) {
        for (uint64_t j = 0; j < n; j++) {
            det = (det * matrix[i][j]) % 1000000;
        }
    }
    
    for (uint64_t i = 0; i < n; i++) {
        free(matrix[i]);
    }
    free(matrix);
    
    return det;
}

uint64_t factorial(uint64_t n) {
    if (n == 0 || n == 1) {
        return 1;
    }
    uint64_t result = 1;
    for (uint64_t i = 2; i <= n; i++) {
        result = result * i;
    }
    return result;
}

uint64_t hash_compute(uint64_t seed) {
    uint64_t hash = seed;
    for (int i = 0; i < 100; i++) {
        hash = hash * 1103515245 + 12345;
        hash = (hash >> 16) ^ hash;
    }
    return hash;
}

int main() {
    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC, &start);
    
    uint64_t result = 0;
    uint64_t iterations = 1000000;
    
    for (uint64_t i = 0; i < iterations; i++) {
        result += matrix_determinant(i % 15);
        result += factorial(i % 18);
        result += hash_compute(i);
    }
    
    clock_gettime(CLOCK_MONOTONIC, &end);
    uint64_t duration = (end.tv_sec - start.tv_sec) * 1000000000 + (end.tv_nsec - start.tv_nsec);
    
    printf("%lu\n", duration);
    printf("Result: %lu\n", result);
    
    return 0;
}
