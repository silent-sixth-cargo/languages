# Language Performance Benchmark Results

This document contains performance benchmarks for a compute-heavy task across multiple programming languages. The benchmark performs the same mathematical computation (matrix operations, factorial calculations, and hash computations) 1,000,000 times.

## Test Environment
- **OS**: Linux
- **Shell**: /bin/zsh
- **Optimization Flags Used**:
  - Rust: `cargo build --release` (with opt-level = 3, lto = true, codegen-units = 1)
  - V: `v -prod -autofree`
  - C: `gcc -O3 -march=native -flto compute_heavy.c -o compute_heavy`
  - C++: `g++ -O3 -march=native -flto -std=c++17 compute_heavy.cpp -o compute_heavy`
  - Go: `go build -ldflags="-s -w" -gcflags="-m=0" compute_heavy.go`
  - Zig: `zig build-exe -O ReleaseFast compute_heavy.zig`
  - Java: `javac ComputeHeavy.java` then `java -server ComputeHeavy`
  - Nim: `nim c -d:release -d:danger --opt:speed compute_heavy.nim`
  - OCaml: `ocamlopt -I +unix unix.cmxa compute_heavy.ml -o compute_heavy`
  - D: `dmd -O -release -inline`
  - Crystal: `crystal build --release`
  - Gleam: `gleam run` (compiles to optimized Erlang bytecode)
  - Python: n/a (interpreted)
  - Node.js: n/a (JIT compiled)
  - Bun: n/a (JIT compiled)
  - Julia: n/a (JIT compiled)

## Benchmark Results

### Run 1 (Parent Process Commands)
| Language | Time (nanoseconds) | Time (seconds) | Result Hash | Command Used |
|----------|-------------------|----------------|-------------|--------------|
| Julia    | 630150515         | 0.630          | 3053422219705032040 | julia compute_heavy.jl |
| Rust     | 661568716         | 0.662          | 3053422219705032040 | cargo run --release |
| C        | 671187717         | 0.671          | 3053422219705032040 | gcc -O3 -march=native -flto && ./compute_heavy |
| C++      | 768818563         | 0.769          | 3053422219705032040 | g++ -O3 -march=native -flto && ./compute_heavy |
| Nim      | 832013222         | 0.832          | 3053422219705032040 | nim c -d:release -d:danger --opt:speed && ./compute_heavy |
| Go       | 1042926248        | 1.043          | 3053422219705032040 | go run compute_heavy.go |
| Java     | 1029546927        | 1.030          | 3053422219705032040 | java -server ComputeHeavy |
| Crystal  | 1267754072        | 1.268          | 3053422219705032040 | crystal run --release compute_heavy.cr |
| OCaml    | 1397531986        | 1.398          | 3053422219705032040 | ocamlopt -I +unix unix.cmxa && ./compute_heavy |
| D        | 3013788000        | 3.014          | 3053422219705032040 | dmd -run compute_heavy.d |
| V        | 5945394555        | 5.945          | 3053422219705032040 | v run compute_heavy.v |
| Node.js  | 16357456192       | 16.357         | 3053422219705032040 | node compute_heavy.js |
| Lua      | 20148960000       | 20.149         | 3053422219705032040 | lua compute_heavy.lua |
| Bun      | 24261821880       | 24.262         | 3053422219705032040 | bun run compute_heavy.js |
| Gleam    | 25861704986       | 25.862         | 3053422219705032040 | gleam run |
| Zig      | 28143745361       | 28.144         | 3053422219705032040 | zig run -O ReleaseFast |
| Python   | 35781073037       | 35.781         | 3053422219705032040 | python compute_heavy.py |

### Run 2 (Direct Binary Execution)
| Language | Time (nanoseconds) | Time (seconds) | Result Hash | Command Used |
|----------|-------------------|----------------|-------------|--------------|
| Julia    | 650164745         | 0.650          | 3053422219705032040 | julia compute_heavy.jl |
| Rust     | 648879790         | 0.649          | 3053422219705032040 | ./target/release/compute_heavy |
| C        | 681702637         | 0.682          | 3053422219705032040 | ./compute_heavy |
| C++      | 764223101         | 0.764          | 3053422219705032040 | ./compute_heavy |
| Nim      | 839007379         | 0.839          | 3053422219705032040 | ./compute_heavy |
| Java     | 999388287         | 0.999          | 3053422219705032040 | java -server ComputeHeavy |
| Go       | 1046365333        | 1.046          | 3053422219705032040 | ./compute_heavy |
| Crystal  | 1309278477        | 1.309          | 3053422219705032040 | ./compute_heavy |
| OCaml    | 1379559993        | 1.380          | 3053422219705032040 | ./compute_heavy |
| D        | 1392329500        | 1.392          | 3053422219705032040 | ./compute_heavy |
| V        | 6333588639        | 6.334          | 3053422219705032040 | ./compute_heavy |
| Node.js  | 15975991029       | 15.976         | 3053422219705032040 | node compute_heavy.js |
| Lua      | 20113066000       | 20.113         | 3053422219705032040 | lua compute_heavy.lua |
| Bun      | 24197034668       | 24.197         | 3053422219705032040 | bun run compute_heavy.js |
| Gleam    | 25373820708       | 25.374         | 3053422219705032040 | gleam run |
| Zig      | 25086044355       | 25.086         | 3053422219705032040 | ./compute_heavy |
| Python   | 34718047808       | 34.718         | 3053422219705032040 | python compute_heavy.py |

### Run 3 (Direct Binary Execution)
| Language | Time (nanoseconds) | Time (seconds) | Result Hash | Command Used |
|----------|-------------------|----------------|-------------|--------------|
| Julia    | 619624049         | 0.620          | 3053422219705032040 | julia compute_heavy.jl |
| C        | 659179125         | 0.659          | 3053422219705032040 | ./compute_heavy |
| Rust     | 675275850         | 0.675          | 3053422219705032040 | ./target/release/compute_heavy |
| C++      | 784598432         | 0.785          | 3053422219705032040 | ./compute_heavy |
| Nim      | 820062893         | 0.820          | 3053422219705032040 | ./compute_heavy |
| Java     | 977338518         | 0.977          | 3053422219705032040 | java -server ComputeHeavy |
| Go       | 1072373955        | 1.072          | 3053422219705032040 | ./compute_heavy |
| Crystal  | 1174828966        | 1.175          | 3053422219705032040 | ./compute_heavy |
| OCaml    | 1434989929        | 1.435          | 3053422219705032040 | ./compute_heavy |
| D        | 1389175700        | 1.389          | 3053422219705032040 | ./compute_heavy |
| V        | 6124929316        | 6.125          | 3053422219705032040 | ./compute_heavy |
| Node.js  | 15568294865       | 15.568         | 3053422219705032040 | node compute_heavy.js |
| Lua      | 19782608000       | 19.783         | 3053422219705032040 | lua compute_heavy.lua |
| Bun      | 24158166699       | 24.158         | 3053422219705032040 | bun run compute_heavy.js |
| Gleam    | 25742078739       | 25.742         | 3053422219705032040 | gleam run |
| Zig      | 28519919462       | 28.520         | 3053422219705032040 | ./compute_heavy |
| Python   | 34874661655       | 34.875         | 3053422219705032040 | python compute_heavy.py |

## Average Results (3 runs)
| Rank | Language | Avg Time (ns) | Avg Time (s) | Relative Speed |
|------|----------|---------------|--------------|----------------|
| 1    | Julia    | 633313103     | 0.633        | 1.00x         |
| 2    | Rust     | 661908119     | 0.662        | 1.05x         |
| 3    | C        | 670689826     | 0.671        | 1.06x         |
| 4    | C++      | 772546699     | 0.773        | 1.22x         |
| 5    | Nim      | 830361165     | 0.830        | 1.31x         |
| 6    | Java     | 1002091244    | 1.002        | 1.58x         |
| 7    | Go       | 1053888512    | 1.054        | 1.66x         |
| 8    | Crystal  | 1250620505    | 1.251        | 1.97x         |
| 9    | OCaml    | 1404027303    | 1.404        | 2.22x         |
| 10   | D        | 1598431067    | 1.598        | 2.52x         |
| 11   | V        | 6134637503    | 6.135        | 9.69x         |
| 12   | Node.js  | 15967247362   | 15.967       | 25.22x        |
| 13   | Lua      | 20014878000   | 20.015       | 31.61x        |
| 14   | Bun      | 24205674416   | 24.206       | 38.23x        |
| 15   | Gleam    | 25659201478   | 25.659       | 40.52x        |
| 16   | Zig      | 27249903059   | 27.250       | 43.04x        |
| 17   | Python   | 35124594167   | 35.125       | 55.49x        |

# Language Preferences Analysis

| Language    | Status      | Avg Time (s) | Relative Speed | Reason                                                                                                                |
| ----------- | ----------- | ------------ | -------------- | --------------------------------------------------------------------------------------------------------------------- |
| **Julia**   | ✅ EXCEPTION | 0.633        | 1.00x          | JIT compiled but acceptable due to exceptional performance + scientific computing flexibility                         |
| **Rust**    | ✅ LIKED     | 0.662        | 1.05x          | Binary with direct kernel calls, compiler enforced memory safety, zero-cost abstractions, modern alternative to C/C++ |
| **C**       | ❌ REJECTED  | 0.671        | 1.06x          | Outdated museum language, manual memory management, no safety guarantees                                              |
| **C++**     | ❌ REJECTED  | 0.773        | 1.22x          | Museum language with legacy baggage, complex syntax, no modern safety features                                        |
| **Nim**     | ✅ LIKED     | 0.830        | 1.31x          | Binary compilation, no VM/GC overhead, Python-like syntax with C performance                                          |
| **Java**    | ❌ DISLIKED  | 1.002        | 1.58x          | JVM requirement, garbage collector, enterprise bloat                                                                  |
| **Go**      | ❌ DISLIKED  | 1.054        | 1.66x          | Garbage collector, runtime overhead, Google corporate control                                                         |
| **Crystal** | ❌ DISLIKED  | 1.251        | 1.97x          | Depends on GC, lacks multicore support, ecosystem is limited despite clean syntax                                     |
| **OCaml**   | ❌ REJECTED  | 1.404        | 2.22x          | Functional paradigm limitations, niche ecosystem                                                                      |
| **D**       | ❌ DISLIKED  | 1.598        | 2.52x          | Optional GC, but hampered by poor syntax, weak tooling, and no modern safety features                                 |
| **V**       | ✅ EXCEPTION | 6.135        | 9.69x          | No GC, compiles to binary, acceptable despite current performance limitations, lacks modern safety features           |
| **Node.js** | ✅ TOLERATED | 15.967       | 25.22x         | Interpreted flexibility, mid-tier performance acceptable for rapid development                                        |
| **Lua**     | ✅ TOLERATED | 20.015       | 31.61x         | Lightweight interpreted, good embedding capabilities, acceptable performance                                          |
| **Bun**     | ❌ REJECTED  | 24.206       | 38.23x         | Slower than Node.js, overhyped, no significant advantages                                                             |
| **Gleam**   | ❌ REJECTED  | 25.659       | 40.52x         | BEAM VM dependency, functional limitations                                                                            |
| **Zig**     | ❌ DISLIKED  | 27.250       | 43.04x         | Terrible performance, overhyped, poor ecosystem, not production ready                                                 |
| **Python**  | ✅ TOLERATED | 35.125       | 55.49x         | Interpreted flexibility for scripting, prototyping despite poor performance                                           |


## Categories

### ✅ PREFERRED STACK
- **Rust**: Modern systems language, memory safety without GC
- **Nim**: Python syntax meets C performance

### ✅ EXCEPTIONS
- **Julia**: Scientific computing exception despite JIT
- **V**: No GC, binary compilation despite current performance limitations, lacks modern safety features

### ✅ TOLERATED (Interpreted - Flexibility)
- **Node.js**: JavaScript runtime, rapid development
- **Lua**: Lightweight scripting, embedding
- **Python**: Prototyping, data science, automation

### ❌ REJECTED/DISLIKED (GC/VM/Legacy)
- **Go, Java**: Garbage collectors, VM overhead
- **C, C++**: Legacy museum languages
- **Zig**: Poor performance, overhyped
- **Bun**: Inferior to Node.js
- **Gleam, OCaml**: VM dependencies, niche use
- **Crystal** — Hard GC dependency, limited parallelism, weak ecosystem
- **D** — Optional GC but poor syntax, fragmented tooling, lacks modern safety features

## Optimization Flags Summary

| Language | Optimization Flags | Status |
|----------|-------------------|--------|
| Rust     | `cargo build --release` (opt-level=3, lto=true, codegen-units=1) | Optimized |
| Julia    | n/a | JIT compiled |
| C        | `gcc -O3 -march=native -flto` | Optimized |
| C++      | `g++ -O3 -march=native -flto -std=c++17` | Optimized |
| Nim      | `nim c -d:release -d:danger --opt:speed` | Optimized |
| Go       | `go build -ldflags="-s -w" -gcflags="-m=0"` | Optimized |
| Java     | `javac` then `java -server` | JIT optimized |
| V        | `v run` (production flags not available in this version) | Basic optimized |
| Node.js  | n/a | JIT compiled |
| Bun      | n/a | JIT compiled |
| Gleam    | `gleam run` | Erlang bytecode |
| OCaml    | `ocamlopt -I +unix unix.cmxa` | Optimized |
| Python   | n/a | Interpreted |
| Zig      | `zig build-exe -O ReleaseFast` | Optimized |
| Lua      | n/a | Interpreted |
| D        | `dmd -O -release -inline` | Optimized |
| Crystal  | `crystal build --release` | Optimized |

## Testing Methodology Summary

| Language | Run 1 (Parent Process) | Run 2 & 3 (Binary Execution) | Binary Type |
|----------|------------------------|-------------------------------|-------------|
| Rust     | `cargo run --release` | `./target/release/compute_heavy` | Native binary |
| Julia    | `julia compute_heavy.jl` | `julia compute_heavy.jl` | JIT compiled |
| C        | `gcc -O3 && ./compute_heavy` | `./compute_heavy` | Native binary |
| C++      | `g++ -O3 && ./compute_heavy` | `./compute_heavy` | Native binary |
| Nim      | `nim c -d:release && ./compute_heavy` | `./compute_heavy` | Native binary |
| Go       | `go run compute_heavy.go` | `./compute_heavy` | Native binary |
| Java     | `java -server ComputeHeavy` | `java -server ComputeHeavy` | JIT compiled |
| V        | `v run compute_heavy.v` | `./compute_heavy` | Native binary |
| Node.js  | `node compute_heavy.js` | `node compute_heavy.js` | JIT compiled |
| Bun      | `bun run compute_heavy.js` | `bun run compute_heavy.js` | JIT compiled |
| Gleam    | `gleam run` | `gleam run` | Erlang bytecode |
| OCaml    | `ocamlopt && ./compute_heavy` | `./compute_heavy` | Native binary |
| Python   | `python compute_heavy.py` | `python compute_heavy.py` | Interpreted |
| Zig      | `zig run -O ReleaseFast` | `./compute_heavy` | Native binary |
| Lua      | `lua compute_heavy.lua` | `lua compute_heavy.lua` | Interpreted |
| D        | `dmd -run compute_heavy.d` | `./compute_heavy` | Native binary |
| Crystal  | `crystal run --release compute_heavy.cr` | `./compute_heavy` | Native binary |


## Notes
- All tests run on the same machine with same resource allocation
- Each implementation performs identical mathematical operations
- Results are measured in nanoseconds for precision
- The "Result Hash" column verifies computational correctness across languages
- Relative speed is calculated compared to the fastest implementation
- **Testing Methodology**:
  - **Run 1**: Parent process commands (e.g., `cargo run`, `go run`, `java`, etc.)
  - **Run 2 & 3**: Direct binary execution (e.g., `./compute_heavy`) for compiled languages
  - **Interpreted/JIT languages**: Same command used for all runs as no separate binary exists
- **All implementations now produce consistent results**: OCaml, Gleam, Node.js, and Bun have been fixed to produce the correct computational hash (3053422219705032040), ensuring all languages perform identical mathematical operations.
- **Gleam Implementation**: Successfully implemented with proper uint64 overflow simulation to match other languages' behavior.
- **OCaml Fix**: Corrected unsigned 64-bit arithmetic simulation to match other languages' overflow behavior.
- **JavaScript Fixes**: Both Node.js and Bun now use BigInt with proper 64-bit unsigned integer overflow simulation to match the mathematical precision of compiled languages.
- **Python Fix**: Updated Python implementation to use `int` type with proper 64-bit unsigned integer overflow simulation to match the mathematical precision of compiled languages.
