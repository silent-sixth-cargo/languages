-- Lua implementation with 64-bit integer simulation
local function uint64_mask(n)
    -- Simulate 64-bit unsigned integer overflow
    return n & 0xFFFFFFFFFFFFFFFF
end

local function matrix_determinant(size)
    local n = size + 2
    local matrix = {}

    for i = 0, n - 1 do
        matrix[i] = {}
        for j = 0, n - 1 do
            matrix[i][j] = (i * j + 1) % 1000
        end
    end

    local det = 1
    for i = 0, n - 1 do
        for j = 0, n - 1 do
            det = uint64_mask((det * matrix[i][j]) % 1000000)
        end
    end
    return det
end

local function factorial(n)
    if n == 0 or n == 1 then
        return 1
    end
    local result = 1
    for i = 2, n do
        result = uint64_mask(result * i)
    end
    return result
end

local function hash_compute(seed)
    local hash = seed
    for i = 1, 100 do
        hash = uint64_mask(hash * 1103515245 + 12345)
        hash = uint64_mask((hash >> 16) ~ hash)
    end
    return hash
end

local function get_time_ns()
    local clock = os.clock()
    return math.floor(clock * 1000000000)
end

local start_time = get_time_ns()

local result = 0
local iterations = 1000000

for i = 0, iterations - 1 do
    result = uint64_mask(result + matrix_determinant(i % 15))
    result = uint64_mask(result + factorial(i % 18))
    result = uint64_mask(result + hash_compute(i))
end

local end_time = get_time_ns()
local duration = end_time - start_time

print(duration)
print("Result: " .. result)
