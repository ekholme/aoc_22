data = readlines("./data/day4.txt")

#Part 1

y = split.(data, r",|-")

z = map(x -> parse.(Int, string.(x)), y)

function is_overlap(x)
    if (
        (x[1] >= x[3] && x[2] <= x[4] ) |
        (x[3] >= x[1] && x[4] <= x[2])
        )

        return true
    else return false
    end
end

res1 = sum(is_overlap.(z))

# Part 2

