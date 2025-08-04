import java.util.Arrays;

public class ComputeHeavy {

    public static long matrixDeterminant(long size) {
        long n = size + 2;
        long[][] matrix = new long[(int)n][(int)n];

        for (long i = 0; i < n; i++) {
            for (long j = 0; j < n; j++) {
                matrix[(int)i][(int)j] = (i * j + 1) % 1000;
            }
        }

        long det = 1;
        for (long i = 0; i < n; i++) {
            for (long j = 0; j < n; j++) {
                det = (det * matrix[(int)i][(int)j]) % 1000000;
            }
        }
        return det;
    }

    public static long factorial(long n) {
        if (n == 0 || n == 1) {
            return 1;
        }
        long result = 1;
        for (long i = 2; i <= n; i++) {
            result = result * i;
        }
        return result;
    }

    public static long hashCompute(long seed) {
        long hash = seed;
        for (int i = 0; i < 100; i++) {
            hash = hash * 1103515245L + 12345L;
            hash = (hash >>> 16) ^ hash;
        }
        return hash;
    }

    public static void main(String[] args) {
        long start = System.nanoTime();

        long result = 0;
        long iterations = 1_000_000;

        for (long i = 0; i < iterations; i++) {
            result += matrixDeterminant(i % 15);
            result += factorial(i % 18);
            result += hashCompute(i);
        }

        long duration = System.nanoTime() - start;
        System.out.println(duration);
        System.out.println("Result: " + result);
        System.exit(0);
    }
}
