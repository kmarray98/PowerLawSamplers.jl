include("Samplers.jl")

function pl_graph(n, α, x_min) 
    G = Matrix{Float64}(zeros(n, n)) 
    us = rand(n)
    for i in 1:n
        #println(i)
        neighbours = sample(1:n,  bounded_double_up_sampler(α, x_min, us[i], n); replace=false)
        G[i,neighbours] .= 1.0
    end

    return(G)

end
