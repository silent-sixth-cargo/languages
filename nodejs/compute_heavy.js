const MAX_U64 = 0xffffffffffffffffn;

function uint64(n) {
  return BigInt(n) & MAX_U64;
}

function matrixDeterminant(size) {
  const n = size + 2;
  const matrix = Array(n)
    .fill(null)
    .map(() => Array(n).fill(0));

  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      matrix[i][j] = (i * j + 1) % 1000;
    }
  }

  let det = 1n;
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      det = (det * BigInt(matrix[i][j])) % 1000000n;
    }
  }
  return det;
}

function factorial(n) {
  if (n === 0 || n === 1) {
    return 1n;
  }
  let result = 1n;
  for (let i = 2; i <= n; i++) {
    result = uint64(result * BigInt(i));
  }
  return result;
}

function hashCompute(seed) {
  let hash = BigInt(seed);
  for (let i = 0; i < 100; i++) {
    hash = uint64(hash * 1103515245n + 12345n);
    hash = uint64((hash >> 16n) ^ hash);
  }
  return hash;
}

function main() {
  const start = process.hrtime.bigint();

  let result = 0n;
  const iterations = 1_000_000;

  for (let i = 0; i < iterations; i++) {
    result = uint64(result + matrixDeterminant(i % 15));
    result = uint64(result + factorial(i % 18));
    result = uint64(result + hashCompute(i));
  }

  const duration = process.hrtime.bigint() - start;
  console.log(duration.toString());
  console.log("Result:", result.toString());
  process.exit(0);
}

main();
