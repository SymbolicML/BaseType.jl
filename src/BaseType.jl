module BaseType

export base_numeric_type

"""
    base_numeric_type(::Type{T}) where {T}
    base_numeric_type(x::T)

Extract the base numeric type from a numerical type `T` such
as a measurement or a quantity.

For example,

| Input Type | Output Type |
|---|---|
| `Float32` | `Float32` |
| `ComplexF32` | `Float32` |
| `Measurement{Float32}` | `Float32` |
| `Rational{Int8}` | `Int8` |
| `Dual{BigFloat}` | `BigFloat` |
| `Quantity{Float32,Dimensions}` | `Float32` |
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
    return isempty(params) ? T : _base_numeric_type(first(params))
    # TODO: deal with recursive types
end

end
