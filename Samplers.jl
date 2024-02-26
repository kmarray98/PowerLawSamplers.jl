using SpecialFunctions

function double_up_sampler(α, x_min,u) 
    guess = x_min
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


function bounded_double_up_sampler(α, x_min,u, top_bound) 
    guess = x_min
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

function inexact_sampler(α, x_min,u) 
    guess = x_min
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