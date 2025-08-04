(* Simulate unsigned 64-bit arithmetic by masking to 64 bits *)
let uint64_mask = 0xFFFFFFFFFFFFFFFFL

let uint64_add a b =
  Int64.logand (Int64.add a b) uint64_mask

let uint64_mul a b =
  Int64.logand (Int64.mul a b) uint64_mask

let matrix_determinant size =
  let n = Int64.to_int (Int64.add size 2L) in
  let matrix = Array.make_matrix n n 0L in

  for i = 0 to n - 1 do
    for j = 0 to n - 1 do
      matrix.(i).(j) <- Int64.rem (Int64.add (Int64.mul (Int64.of_int i) (Int64.of_int j)) 1L) 1000L
    done
  done;

  let det = ref 1L in
  for i = 0 to n - 1 do
    for j = 0 to n - 1 do
      det := Int64.rem (uint64_mul !det matrix.(i).(j)) 1000000L
    done
  done;
  !det

let factorial n =
  if n = 0L || n = 1L then
    1L
  else
    let result = ref 1L in
    for i = 2 to Int64.to_int n do
      result := uint64_mul !result (Int64.of_int i)
    done;
    !result

let hash_compute seed =
  let hash = ref seed in
  for _ = 1 to 100 do
    hash := uint64_add (uint64_mul !hash 1103515245L) 12345L;
    hash := Int64.logxor (Int64.shift_right_logical !hash 16) !hash
  done;
  !hash

let () =
  let start_time = Unix.gettimeofday () in

  let result = ref 0L in
  let iterations = 1_000_000L in

  for i = 0 to Int64.to_int iterations - 1 do
    let i64 = Int64.of_int i in
    result := uint64_add !result (matrix_determinant (Int64.rem i64 15L));
    result := uint64_add !result (factorial (Int64.rem i64 18L));
    result := uint64_add !result (hash_compute i64)
  done;

  let end_time = Unix.gettimeofday () in
  let duration = Int64.of_float ((end_time -. start_time) *. 1_000_000_000.0) in

  Printf.printf "%Ld\n" duration;
  Printf.printf "Result: %Ld\n" !result;
  exit 0
