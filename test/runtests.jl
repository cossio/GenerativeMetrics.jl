using LinearAlgebra, Random, Test
using SafeTestsets

@time @safetestset "metrics" begin include("metrics.jl") end
