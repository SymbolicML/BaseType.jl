# BaseType.jl

[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://SymbolicML.org/BaseType.jl/dev/)
[![Build Status](https://github.com/SymbolicML/BaseType.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/SymbolicML/BaseType.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

This package currently exports a tiny function `base_numeric_type` that
extracts the base numeric type from a numeric type `T`:

- `base_numeric_type(::Type{T}) where {T}`
- `base_numeric_type(x::T)`

For example,

| Input Type | Output Type |
|---|---|
| `Float32` | `Float32` |
| `ComplexF32` | `Float32` |
| `Measurement{Float32}` | `Float32` |
| `Dual{BigFloat}` | `BigFloat` |
| `Rational{Int8}` | `Int8` |
| `Quantity{Float32,Dimensions}` | `Float32` |

Packages should write a method to `base_numeric_type`
when the base type of a numeric type
is not the first parametric type.
For example, if you were to create a quantity-like type
`Quantity{Dimensions,NumericType}`, you would need
to write a custom interface.

But if the base type comes first,
the default method will work.
