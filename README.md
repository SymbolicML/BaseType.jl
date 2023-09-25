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
| `Dual{ComplexF32}` | `Float32` |
| `Rational{Int8}` | `Int8` |
| `Quantity{Float32, ...}` | `Float32` |
| `Quantity{Measurement{Float32}, ...}` | `Float32` |

Package maintainers should write a specialized method for their type.
For example, to define the base numeric type for a dual number, one could write:

```julia
import BaseType: base_numeric_type

base_numeric_type(::Type{Dual{T}}) where {T} = base_numeric_type(T)
```

It is important to call `base_numeric_type` recursively like this to deal with
nested numeric types such as `Quantity{Measurement{T}}`.

The fallback behavior of `base_numeric_type` is to return the *first* type parameter,
or, if that type has parameters of its own (such as `Dual{Complex{Float32}}`),
to recursively take the first type parameter until a non-parameterized type is found.
This works for the vast majority of types, but it is still preferred
if package maintainers write a specialized method.
