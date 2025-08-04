function matrix_determinant(size::UInt64)::UInt64
    n = size + 2
    matrix = Matrix{UInt64}(undef, n, n)

    for i in 1:n
        for j in 1:n
            matrix[i, j] = ((i-1) * (j-1) + 1) % 1000
        end
    end

    det = UInt64(1)
    for i in 1:n
        for j in 1:n
            det = (det * matrix[i, j]) % 1000000
        end
    end
    return det
end

function factorial(n::UInt64)::UInt64
    if n == 0 || n == 1
        return UInt64(1)
    end
    result = UInt64(1)
    for i in 2:n
        result = result * i
    end
    return result
end

function hash_compute(seed::UInt64)::UInt64
    hash = seed
    for _ in 1:100
        hash = hash * 1103515245 + 12345
        hash = (hash >> 16) ⊻ hash
    end
    return hash
end

function main()
    start_time = time_ns()

    result = UInt64(0)
    iterations = 1_000_000

    for i in 0:(iterations-1)
        result += matrix_determinant(UInt64(i % 15))
        result += factorial(UInt64(i % 18))
        result += hash_compute(UInt64(i))
    end

    duration = time_ns() - start_time
    println(duration)
    println("Result: ", result)
    exit(0)
end

main()
