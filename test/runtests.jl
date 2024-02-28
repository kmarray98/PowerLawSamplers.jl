using PowerLawSamplers
using Test

@testset "PowerLawSamplers.jl" begin
    @test PowerLawSamplers.doubling_up_sampler(1.1,1,0.01) == 2.0
end
