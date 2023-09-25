module BaseType

export base_numeric_type

"""
    base_numeric_type(::Type{T}) where {T}
    base_numeric_type(x::T)

Extract the base numeric type from a numerical type `T` such
as a measurement or a quantity.

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
"""
@generated function base_numeric_type(::Type{T}) where {T}
    # This uses a generated function for type stability in Julia <=1.9,
    # though in Julia >=1.10 it is not necessary.
    # TODO: switch to non-generated when Julia >= 1.10 is LTS.
    return :($(_base_numeric_type(T)))
end
base_numeric_type(x) = base_numeric_type(typeof(x))

function _base_numeric_type(::Type{T}) where {T}
    params = T isa UnionAll ? T.body.parameters : T.parameters
    if isempty(params)
        return T
    else
        return _base_numeric_type(first(params))
    end
end

end
