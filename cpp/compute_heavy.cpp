#include <iostream>
#include <vector>
#include <chrono>
#include <cstdint>
#include <cstdlib>

uint64_t matrix_determinant(uint64_t size) {
    uint64_t n = size + 2;
    std::vector<std::vector<uint64_t>> matrix(n, std::vector<uint64_t>(n));
    
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
    auto start = std::chrono::high_resolution_clock::now();
    
    uint64_t result = 0;
    const uint64_t iterations = 1000000;
    
    for (uint64_t i = 0; i < iterations; i++) {
        result += matrix_determinant(i % 15);
        result += factorial(i % 18);
        result += hash_compute(i);
    }
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
    
    std::cout << duration.count() << std::endl;
    std::cout << "Result: " << result << std::endl;
    
    return 0;
}
