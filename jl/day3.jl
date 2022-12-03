data = readlines("./data/day3.txt")

letters = string.(collect('a':'z'))
LETTERS = string.(collect('A':'Z'))

all_letters = vcat(letters, LETTERS)

# Part 1

function my_split(x)
    h = Integer(length(x) / 2)

    x1 = split(x[begin:h], "")
    x2 = split(x[(h+1):end], "")

    ret = [x1, x2]

    return ret
end

function solve(x)

    tmp = my_split(x)

    y = intersect(tmp[1], tmp[2])

    return indexin(y, all_letters)

end

res1 = sum(solve.(data))

# Part 2

vals = []

for i in collect(1:3:300)
    tmp = data[i:(i+2)]

    res = intersect(split.(tmp, "")...)

    #y = getindex(res)

    push!(vals, getindex(res, all_letters))

end