use std::time::Instant;

fn main() {
    let start = Instant::now();
    
    let mut _result = 0u64;
    let iterations = 1_000_000;
    
    for i in 0..iterations {
        _result += matrix_determinant(i % 15);
        _result += factorial(i % 18);
        _result += hash_compute(i);
    }
    
    let duration = start.elapsed().as_nanos();
    println!("{}", duration);
    println!("Result: {}", _result);
    std::process::exit(0);
}

fn matrix_determinant(size: u64) -> u64 {
    let n = size + 2;
    let mut matrix = vec![vec![0u64; n as usize]; n as usize];
    
    for i in 0..n {
        for j in 0..n {
            matrix[i as usize][j as usize] = (i * j + 1) % 1000;
        }
    }
    
    let mut det = 1u64;
    for i in 0..n {
        for j in 0..n {
            det = (det * matrix[i as usize][j as usize]) % 1000000;
        }
    }
    det
}

fn factorial(n: u64) -> u64 {
    if n == 0 || n == 1 {
        return 1;
    }
    let mut result = 1u64;
    for i in 2..=n {
        result = result.wrapping_mul(i);
    }
    result
}

fn hash_compute(seed: u64) -> u64 {
    let mut hash = seed;
    for _ in 0..100 {
        hash = hash.wrapping_mul(1103515245).wrapping_add(12345);
        hash = (hash >> 16) ^ hash;
    }
    hash
}
