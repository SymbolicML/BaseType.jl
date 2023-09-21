# BaseType.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://SymbolicML.org/BaseType.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://SymbolicML.org/BaseType.jl/dev/)
[![Build Status](https://github.com/SymbolicML/BaseType.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/SymbolicML/BaseType.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

This package defines a tiny function `base_numeric_type` that
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
when the base numeric type of a container type
is not the first parametric type. Otherwise,
the default method will already be valid.

Furthermore, this is not needed for container types
that inherit from `AbstractArray{T}`, as `T`
will be taken as the base numeric type.
