# BaseType.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://MilesCranmer.github.io/BaseType.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://MilesCranmer.github.io/BaseType.jl/dev/)
[![Build Status](https://github.com/MilesCranmer/BaseType.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/MilesCranmer/BaseType.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

This package defines a function `base_numeric_type` that
extracts the base numeric type from a possible container type `T`.

- `base_numeric_type(::Type{T}) where {T}`
- `base_numeric_type(x::T)`

For example,

```julia
[
    Float32 => Float32,
    Array{Float64,1} => Float64,
    ComplexF64 => Float64,
    Vector{ComplexF64} => ComplexF64,
    Dual{BigFloat} => BigFloat,
    Quantity{Int64,Dimensions} => Int64,
    Measurement{Float32} => Float32,
]
```

Packages should write a method to `base_numeric_type`
the base numeric type of a container
is not the **first parametric type**, which is the default.

However, this is not needed for container types
that inherit from `AbstractArray{T}`, where `T`
will be taken as the base numeric type.
