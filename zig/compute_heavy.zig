const std = @import("std");
const print = std.debug.print;

fn matrixDeterminant(size: u64) u64 {
    const n = size + 2;
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var matrix = allocator.alloc([]u64, n) catch unreachable;
    defer allocator.free(matrix);

    for (0..n) |i| {
        matrix[i] = allocator.alloc(u64, n) catch unreachable;
    }
    defer {
        for (0..n) |i| {
            allocator.free(matrix[i]);
        }
    }

    for (0..n) |i| {
        for (0..n) |j| {
            matrix[i][j] = (i * j + 1) % 1000;
        }
    }

    var det: u64 = 1;
    for (0..n) |i| {
        for (0..n) |j| {
            det = (det *% matrix[i][j]) % 1000000;
        }
    }
    return det;
}

fn factorial(n: u64) u64 {
    if (n == 0 or n == 1) {
        return 1;
    }
    var result: u64 = 1;
    var i: u64 = 2;
    while (i <= n) : (i += 1) {
        result = result *% i;
    }
    return result;
}

fn hashCompute(seed: u64) u64 {
    var hash = seed;
    for (0..100) |_| {
        hash = hash *% 1103515245 +% 12345;
        hash = (hash >> 16) ^ hash;
    }
    return hash;
}

pub fn main() !void {
    const start = std.time.nanoTimestamp();

    var result: u64 = 0;
    const iterations: u64 = 1_000_000;

    for (0..iterations) |i| {
        result +%= matrixDeterminant(i % 15);
        result +%= factorial(i % 18);
        result +%= hashCompute(i);
    }

    const duration = std.time.nanoTimestamp() - start;
    print("{d}\n", .{duration});
    print("Result: {d}\n", .{result});
    std.process.exit(0);
}
