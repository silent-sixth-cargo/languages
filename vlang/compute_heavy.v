import time

fn main() {
    start := time.now()

    mut result := u64(0)
    iterations := 1_000_000

    for i in 0..iterations {
        result += matrix_determinant(u64(i % 15))
        result += factorial(u64(i % 18))
        result += hash_compute(u64(i))
    }

    duration := time.now() - start
    println(duration.nanoseconds())
    println("Result: ${result}")
    exit(0)
}

fn matrix_determinant(size u64) u64 {
    n := size + 2
    mut matrix := [][]u64{len: int(n), init: []u64{len: int(n)}}

    for i in 0..n {
        for j in 0..n {
            matrix[i][j] = (i * j + 1) % 1000
        }
    }

    mut det := u64(1)
    for i in 0..n {
        for j in 0..n {
            det = (det * matrix[i][j]) % 1000000
        }
    }
    return det
}

fn factorial(n u64) u64 {
    if n == 0 || n == 1 {
        return 1
    }
    mut result := u64(1)
    for i in 2..n + 1 {
        result = result * i
    }
    return result
}

fn hash_compute(seed u64) u64 {
    mut hash := seed
    for _ in 0..100 {
        hash = hash * 1103515245 + 12345
        hash = (hash >> 16) ^ hash
    }
    return hash
}
