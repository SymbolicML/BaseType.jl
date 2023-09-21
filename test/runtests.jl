using BaseType
using Test
using Aqua

@testset "BaseType.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(BaseType)
    end
    # Write your tests here.
end
