import time

def matrix_determinant(size):
    n = size + 2
    matrix = [[0 for _ in range(n)] for _ in range(n)]

    for i in range(n):
        for j in range(n):
            matrix[i][j] = (i * j + 1) % 1000

    det = 1
    for i in range(n):
        for j in range(n):
            det = (det * matrix[i][j]) % 1000000
    return det

def factorial(n):
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result = (result * i) & 0xFFFFFFFFFFFFFFFF
    return result

def hash_compute(seed):
    hash_val = seed
    for _ in range(100):
        hash_val = ((hash_val * 1103515245 + 12345) & 0xFFFFFFFFFFFFFFFF)
        hash_val = ((hash_val >> 16) ^ hash_val) & 0xFFFFFFFFFFFFFFFF
    return hash_val

def main():
    start = time.time_ns()

    result = 0
    iterations = 1_000_000

    for i in range(iterations):
        result = (result + matrix_determinant(i % 15)) & 0xFFFFFFFFFFFFFFFF
        result = (result + factorial(i % 18)) & 0xFFFFFFFFFFFFFFFF
        result = (result + hash_compute(i)) & 0xFFFFFFFFFFFFFFFF

    duration = time.time_ns() - start
    print(duration)
    print(f"Result: {result}")
    exit(0)

if __name__ == "__main__":
    main()
