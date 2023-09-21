using BaseType
using Test
using Aqua

@testset "BaseType.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(BaseType)
    end
    @testset "Unit tests" begin
        include("unittests.jl")
    end
end
