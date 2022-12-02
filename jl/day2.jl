# Part 1

data = readlines("./data/day2.txt")

data = replace.(data, r"A|X" => "rock", r"B|Y" => "paper", r"Z|C" => "scissors")

x = split.(data, " ")

struct Round
    x::String
    y::String
end

function compare_round(r::Round)
    if r.x == r.y
        return 3
    elseif (
        (r.x == "rock" && r.y == "paper") |
        (r.x == "paper" && r.y == "scissors") |
        (r.x == "scissors" && r.y == "rock")
        )
        return 6
    else 
        return 0
    end
end

function score_round(r::Round)
   base_score =  if r.y == "rock"
        1
   elseif r.y == "paper"
        2 
    else
        3
    end

    comp_score = compare_round(r)

    return base_score + comp_score
end

rs = []

for i in eachindex(x)
    r = Round(x[i][1], x[i][2])

    push!(rs, r)
end

res = score_round.(rs)

sum(res)

# Part 2

data = readlines("./data/day2.txt")

data = replace.(
    data,
    "A" => "rock",
    "B" => "paper",
    "C" => "scissors",
    "X" => "lose",
    "Y" => "draw",
    "Z" => "win"
)

x = split.(data, " ")

mutable struct Round2 
    x::String
    y::String
    outcome::String
    compare_score::Int
    base_score::Int
end

function get_y(r::Round2)
    if r.outcome == "draw"
        r.y = r.x
    elseif (
        (r.x == "rock" && r.outcome == "win") |
        (r.x == "scissors" && r.outcome == "lose")
    )
        r.y = "paper"
    elseif (
        (r.x == "rock" && r.outcome == "lose" ) |
        (r.x == "paper" && r.outcome == "win") 
    )
        r.y = "scissors"
    else
        r.y = "rock"
    end

    return r
end

function base_score(r::Round2)
    if r.y == "rock"
        r.base_score = 1
    elseif r.y == "paper"
        r.base_score = 2
    else
        r.base_score = 3
    end

    return r
end

function compare_round(r::Round2)
    if r.x == r.y
        r.compare_score = 3
    elseif (
        (r.x == "rock" && r.y == "paper") |
        (r.x == "paper" && r.y == "scissors") |
        (r.x == "scissors" && r.y == "rock")
        )
        r.compare_score = 6
    else 
        r.compare_score = 0
    end

    return r
end

function score_round(r::Round2)

    r = get_y(r)
    r = base_score(r)
    r = compare_round(r)

    return r.base_score + r.compare_score
end

rs = []

for i in eachindex(x)
    r = Round2(x[i][1], "", x[i][2], 0, 0)

    push!(rs, r)
end

res2 = score_round.(rs)

sum(res2)