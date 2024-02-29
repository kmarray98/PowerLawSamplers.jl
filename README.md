# PowerLawSamplers.jl - sampling random variables from discrete power law distributions

Pure Julia implementations of the "doubling up" and "inexact" samplers for sampling from discrete power law
distributions in Appendix D of Clauset, Newman, and Shalizi (2009). Also includes an doubling up sampler
for censored discrete power law distributions, and a generator for the adjacency matrix of directed random
networks with power law out-degree distributions.

Transform a sequence of uniform random numbers to a sample from a discrete power-law distribution
using the exact sampler in Appendix D of Clauset, Newman, and Shalizi (2009).

```
using PowerLawSamplers, Random

us = rand(100)
new_sample = doubling_up_sampler.(2.1, 1, us) # sampler takes one random number u and transforms it to a varibale
# sampled from discrete power law distribution. 

```

Sample the adjacency matrix of a simple random directed network with a power-law degree distribution. Uses the exact discrete censored
sampler within the function because out-degree is discrete and truncated at the top by N (as no multi-edges or self-edges).

```
using PowerLawSamplers, Plots, LinearAlgebra

G = pl_random_graph(100, 2.3, 1) # adjacency matrix of directed random graph with power law out-degree distribution
degs = vec(sum(G, dims=1))
histogram(degs) # plotting out-degree distribution
```

