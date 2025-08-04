export function monotonic_time() {
  return BigInt(Math.floor(performance.now() * 1000000));
}
