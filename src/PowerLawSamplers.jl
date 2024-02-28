module PowerLawSamplers

using SpecialFunctions, LinearAlgebra, Random

# Write your package code here.

include("Samplers.jl")
#include("RandomGraph.jl")

function pl_graph(n, α, x_min) 
    G = Matrix{Float64}(zeros(n, n)) 
    us = rand(n)
    for i in 1:n
        #println(i)
        neighbours = sample(1:n,  bounded_doubling_up_sampler(α, x_min, us[i], n); replace=false)
        G[i,neighbours] .= 1.0
    end

    return(G)

end

export doubling_up_sampler, bounded_doubling_up_sampler, inexact_sampler, pl_graph

end
