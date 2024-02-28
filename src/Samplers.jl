using SpecialFunctions


"""
Exact sampler for observations from discrete power law distribution from Appendix D of Clauset, Shalizi, and Newman -
power law distributions in empirical data.
α is the power law exponent
x_min is the minimum value the outcome can take in the sampler. We suggest setting x_min > 0
for performance reasons (i.e not exactly 0.0)
u is a random number between 0 and 1 transformed into a power law distributed number.

To use, generate a sequence of us from a U(0,1) distribution, and apply the sampler to transform them into
a sample from a discrete power law distribution

"""

function doubling_up_sampler(α, x_min,u) 
    guess = x_min
    g_1 = x_min
    while zeta(α, guess)/zeta(α, x_min) ≥ 1-u 
        g_1 = guess
        guess = 2*g_1
    end
    guess = guess/2
    while zeta(α, guess)/zeta(α, x_min) ≥ 1-u 
        guess += 1
    end
    return(guess)
end

"""
Exact sampler for observations from discrete power law distribution with an upper bound from Appendix D of Clauset, Shalizi, and Newman -
power law distributions in empirical data.
α is the power law exponent
x_min is the minimum value the outcome can take in the sampler. We suggest setting x_min > 0
for performance reasons (i.e not exactly 0.0).
u is a random number between 0 and 1 transformed into a power law distributed number.
top_bound is the highest possible number the sample can take.

To use, generate a sequence of us from a U(0,1) distribution, and apply the sampler to transform them into
a sample from a discrete power law distribution

"""

function bounded_doubling_up_sampler(α, x_min,u, top_bound) 
    guess = x_min
    g_1 = x_min
    while zeta(α, guess)/zeta(α, x_min) ≥ 1-u && guess < top_bound
        g_1 = guess
        guess = 2*g_1
    end
    guess = guess/2
    while zeta(α, guess)/zeta(α, x_min) ≥ 1-u && guess < top_bound
        guess += 1
    end
    return(Int64(guess))
end

"""
Inexact sampler for observations from discrete power law distribution from Appendix D of Clauset, Shalizi, and Newman -
power law distributions in empirical data.
α is the power law exponent
x_min is the minimum value the outcome can take in the sampler. We suggest setting x_min > 0
for performance reasons (i.e not exactly 0.0)
u is a random number between 0 and 1 transformed into a power law distributed number.

To use, generate a sequence of us from a U(0,1) distribution, and apply the sampler to transform them into
a sample from a discrete power law distribution

"""

function inexact_sampler(α, x_min,u) 
    guess = x_min
    g_1 = x_min
    while zeta(α, guess)/zeta(α, x_min) ≥ 1-u
        g_1 = guess
        guess = 2*g_1
    end
    guess = guess/2
    while zeta(α, guess)/zeta(α, x_min) ≥ 1-u
        guess += 1
    end
    return(guess)
end
