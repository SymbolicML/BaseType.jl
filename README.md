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
|:-:|---|
| `Float32` | `Float32` |
| `ComplexF32` | `Float32` |
| `Measurement{Float32}` | `Float32` |
| `Dual{BigFloat}` | `BigFloat` |
| `Rational{Int8}` | `Int8` |
| `Quantity{Float32, ...}` | `Float32` |
| `Quantity{Measurement{Float32}, ...}` | `Float32` |
| `Dual{Complex{Float32}}` | `Float32` |

The standard behavior is to return the *first* type parameter,
or, if that type has parameters of its own (such as `Dual{Complex{Float32}}`),
to recursively take the first type parameter until a non-parameterized type is found.

Packages should write a custom method for `base_numeric_type`
if this behavior is incompatible with their type.
For example, if you were to create a quantity-like type
`Quantity{Dimensions,T}`, for a numeric type `T`,
you would need to write a custom interface to return `T`.
