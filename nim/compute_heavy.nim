import times

proc matrixDeterminant(size: uint64): uint64 =
  let n = size + 2
  var matrix = newSeq[seq[uint64]](n)
  for i in 0..<n:
    matrix[i] = newSeq[uint64](n)
  
  for i in 0..<n:
    for j in 0..<n:
      matrix[i][j] = (i * j + 1) mod 1000
  
  var det = 1'u64
  for i in 0..<n:
    for j in 0..<n:
      det = (det * matrix[i][j]) mod 1000000
  det

proc factorial(n: uint64): uint64 =
  if n == 0 or n == 1:
    return 1
  var result = 1'u64
  for i in 2..n:
    result = result * i
  result

proc hashCompute(seed: uint64): uint64 =
  var hash = seed
  for _ in 0..<100:
    hash = hash * 1103515245 + 12345
    hash = (hash shr 16) xor hash
  hash

proc main() =
  let start = cpuTime()
  
  var result = 0'u64
  let iterations = 1_000_000'u64
  
  for i in 0..<iterations:
    result += matrixDeterminant(i mod 15)
    result += factorial(i mod 18)
    result += hashCompute(i)
  
  let duration = ((cpuTime() - start) * 1_000_000_000).uint64
  echo duration
  echo "Result: ", result
  quit(0)

main()
