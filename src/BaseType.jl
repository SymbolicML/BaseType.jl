module BaseType

export base_numeric_type

"""
    base_numeric_type(::Type{T}) where {T}
    base_numeric_type(x::T)

Extract the base numeric type from a possible container type `T`.

For example,
```julia
[
    Float32 => Float32,
    Float32 => Float32,
    Array{Float64,1} => Float64,
    ComplexF64 => ComplexF64,
    Dual{Int64} => Int64,
    Quantity{Float32} => Float32,
]
```
"""
function base_numeric_type(x::Type)
    params = x isa UnionAll ? x.body.parameters : x.parameters
    return length(params) == 0 ? x : first(params)
end
base_numeric_type(x) = base_numeric_type(typeof(x))

# Special cases:
base_numeric_type(::Type{<:AbstractArray{T}}) where {T} = T

end
