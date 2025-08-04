import gleam/int
import gleam/io
import gleam/list

@external(erlang, "erlang", "monotonic_time")
@external(javascript, "./ffi.mjs", "monotonic_time")
pub fn get_monotonic_time() -> Int

// Simulate unsigned 64-bit arithmetic by masking overflow
fn uint64_mask(n: Int) -> Int {
  let mask = 18446744073709551615  // 0xFFFFFFFFFFFFFFFF
  int.bitwise_and(n, mask)
}

fn uint64_add(a: Int, b: Int) -> Int {
  uint64_mask(a + b)
}

fn uint64_mul(a: Int, b: Int) -> Int {
  uint64_mask(a * b)
}

fn matrix_determinant(size: Int) -> Int {
  let n = size + 2

  // Compute determinant directly without storing matrix
  let det = list.range(0, n - 1)
    |> list.fold(1, fn(det, i) {
      list.range(0, n - 1)
      |> list.fold(det, fn(acc_det, j) {
        let matrix_val = { i * j + 1 } % 1000
        let product = uint64_mul(acc_det, matrix_val)
        product % 1000000
      })
    })

  det
}

fn factorial(n: Int) -> Int {
  case n {
    0 | 1 -> 1
    _ -> {
      list.range(2, n)
      |> list.fold(1, fn(acc, i) {
        uint64_mul(acc, i)
      })
    }
  }
}

fn hash_compute(seed: Int) -> Int {
  list.range(0, 99)
  |> list.fold(seed, fn(hash, _) {
    let mul_result = uint64_mul(hash, 1103515245)
    let add_result = uint64_add(mul_result, 12345)
    let shifted = int.bitwise_shift_right(add_result, 16)
    uint64_mask(int.bitwise_exclusive_or(shifted, add_result))
  })
}

pub fn main() {
  let start = get_monotonic_time()

  let result = list.range(0, 999999)
    |> list.fold(0, fn(acc, i) {
      let matrix_result = matrix_determinant(i % 15)
      let factorial_result = factorial(i % 18)
      let hash_result = hash_compute(i)
      let sum = uint64_add(acc, matrix_result)
      let sum2 = uint64_add(sum, factorial_result)
      uint64_add(sum2, hash_result)
    })

  let end_time = get_monotonic_time()
  let duration = end_time - start

  io.println(int.to_string(duration))
  io.println("Result: " <> int.to_string(result))
}
