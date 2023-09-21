using Test: @test, @inferred
using BaseType: base_numeric_type
using DualNumbers: DualNumbers
using DynamicQuantities: DynamicQuantities
using Measurements: ±
using StaticArrays: StaticArrays
using Unitful: Unitful

expected_type_pairs = [
    Float32 => Float32,
    Array{Float64,1} => Float64,
    ComplexF64 => Float64,
    Matrix{ComplexF64} => ComplexF64,
    DualNumbers.Dual{Int64} => Int64,
    DynamicQuantities.Quantity{Float32} => Float32,
    typeof(1.5DynamicQuantities.u"km/s") => Float64,
    typeof(1.5f0Unitful.u"km/s") => Float32,
    typeof(StaticArrays.SArray{Tuple{32,3}}(randn(32, 3))) => Float64,
    typeof(StaticArrays.SArray{Tuple{32,3}}(randn(Float32, 32, 3))) => Float32,
    BigFloat => BigFloat,
    typeof(1.5 ± 0.2) => Float64,
    typeof(1.5f0 ± 0.2f0) => Float32,
]

for (x, y) in expected_type_pairs
    @eval @test base_numeric_type($x) == $y
    # Make sure compiler can inline it:
    if VERSION >= v"1.10"
        @eval @inferred $y base_numeric_type($x)
    end
end

@test base_numeric_type(1.5DynamicQuantities.u"km/s") == base_numeric_type(typeof(1.5DynamicQuantities.u"km/s"))
@inferred base_numeric_type(1.5DynamicQuantities.u"km/s")
