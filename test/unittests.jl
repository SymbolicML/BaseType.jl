using Test: @test, @inferred
using BaseType: base_numeric_type
using DualNumbers: DualNumbers
using DynamicQuantities: DynamicQuantities
using Measurements: ±
using Unitful: Unitful

expected_type_pairs = [
    Float32 => Float32,
    ComplexF64 => Float64,
    DualNumbers.Dual{Int64} => Int64,
    DynamicQuantities.Quantity{Float32} => Float32,
    typeof(1.5DynamicQuantities.u"km/s") => Float64,
    typeof(1.5f0Unitful.u"km/s") => Float32,
    BigFloat => BigFloat,
    typeof(1.5 ± 0.2) => Float64,
    typeof(1.5f0 ± 0.2f0) => Float32,
]

for (x, y) in expected_type_pairs
    @eval @test base_numeric_type($x) == $y
    # Make sure compiler can inline it:
    @eval @inferred $y base_numeric_type($x)
end

@test base_numeric_type(1.5DynamicQuantities.u"km/s") == base_numeric_type(typeof(1.5DynamicQuantities.u"km/s"))
@inferred base_numeric_type(1.5DynamicQuantities.u"km/s")
