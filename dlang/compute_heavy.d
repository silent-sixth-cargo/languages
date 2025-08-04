import std.stdio;
import std.datetime.stopwatch;

ulong matrixDeterminant(ulong size) {
    ulong n = size + 2;
    ulong[][] matrix = new ulong[][](n, n);

    for (ulong i = 0; i < n; i++) {
        for (ulong j = 0; j < n; j++) {
            matrix[i][j] = (i * j + 1) % 1000;
        }
    }

    ulong det = 1;
    for (ulong i = 0; i < n; i++) {
        for (ulong j = 0; j < n; j++) {
            det = (det * matrix[i][j]) % 1000000;
        }
    }
    return det;
}

ulong factorial(ulong n) {
    if (n == 0 || n == 1) {
        return 1;
    }
    ulong result = 1;
    for (ulong i = 2; i <= n; i++) {
        result = result * i;
    }
    return result;
}

ulong hashCompute(ulong seed) {
    ulong hash = seed;
    for (int i = 0; i < 100; i++) {
        hash = hash * 1103515245 + 12345;
        hash = (hash >> 16) ^ hash;
    }
    return hash;
}

void main() {
    auto sw = StopWatch(AutoStart.yes);

    ulong result = 0;
    ulong iterations = 1_000_000;

    for (ulong i = 0; i < iterations; i++) {
        result += matrixDeterminant(i % 15);
        result += factorial(i % 18);
        result += hashCompute(i);
    }

    sw.stop();
    long duration = sw.peek.total!"nsecs";

    writeln(duration);
    writefln("Result: %d", result);
}
