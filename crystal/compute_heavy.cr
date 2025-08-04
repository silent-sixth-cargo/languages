require "time"

def matrix_determinant(size : UInt64) : UInt64
  n = size + 2
  matrix = Array.new(n) { Array.new(n, 0_u64) }

  (0...n).each do |i|
    (0...n).each do |j|
      matrix[i][j] = (i.to_u64 * j.to_u64 + 1) % 1000
    end
  end

  det = 1_u64
  (0...n).each do |i|
    (0...n).each do |j|
      det = (det &* matrix[i][j]) % 1000000
    end
  end
  det
end

def factorial(n : UInt64) : UInt64
  return 1_u64 if n == 0 || n == 1

  result = 1_u64
  (2..n).each do |i|
    result = result &* i.to_u64
  end
  result
end

def hash_compute(seed : UInt64) : UInt64
  hash = seed
  100.times do
    hash = hash &* 1103515245_u64 &+ 12345_u64
    hash = (hash >> 16) ^ hash
  end
  hash
end

start_time = Time.monotonic

result = 0_u64
iterations = 1_000_000_u64

(0...iterations).each do |i|
  i_u64 = i.to_u64
  result = result &+ matrix_determinant(i_u64 % 15)
  result = result &+ factorial(i_u64 % 18)
  result = result &+ hash_compute(i_u64)
end

end_time = Time.monotonic
duration = (end_time - start_time).total_nanoseconds.to_u64

puts duration
puts "Result: #{result}"
