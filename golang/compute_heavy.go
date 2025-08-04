package main

import (
	"fmt"
	"os"
	"time"
)

func matrixDeterminant(size uint64) uint64 {
	n := size + 2
	matrix := make([][]uint64, n)
	for i := range matrix {
		matrix[i] = make([]uint64, n)
	}

	for i := uint64(0); i < n; i++ {
		for j := uint64(0); j < n; j++ {
			matrix[i][j] = (i*j + 1) % 1000
		}
	}

	det := uint64(1)
	for i := uint64(0); i < n; i++ {
		for j := uint64(0); j < n; j++ {
			det = (det * matrix[i][j]) % 1000000
		}
	}
	return det
}

func factorial(n uint64) uint64 {
	if n == 0 || n == 1 {
		return 1
	}
	result := uint64(1)
	for i := uint64(2); i <= n; i++ {
		result = result * i
	}
	return result
}

func hashCompute(seed uint64) uint64 {
	hash := seed
	for i := 0; i < 100; i++ {
		hash = hash*1103515245 + 12345
		hash = (hash >> 16) ^ hash
	}
	return hash
}

func main() {
	start := time.Now()

	result := uint64(0)
	iterations := uint64(1_000_000)

	for i := uint64(0); i < iterations; i++ {
		result += matrixDeterminant(i % 15)
		result += factorial(i % 18)
		result += hashCompute(i)
	}

	duration := time.Since(start).Nanoseconds()
	fmt.Println(duration)
	fmt.Printf("Result: %d\n", result)
	os.Exit(0)
}
