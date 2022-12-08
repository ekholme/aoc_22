stks = readlines("./data/day5_stacks.txt")
instructs = readlines("./data/day5_dirs.txt")

#format stacks

z = split.(stks, "")

base_len = length(z[1])

pos = collect(2:4:base_len)

m = mapreduce(permutedims, vcat, z)

m = m[:, pos]

stacks = [Vector{String}(m[:, i]) for i in 1:9]

#format instructions

function parse_instructs(x)
    return parse.(Int, split(replace(x, r"\D+" => " "), " ")[2:4])
end

inst = parse_instructs.(instructs)

#Part 1

aa = ["a", "b", "c"]

deleteat!(aa, 1:2)

aa = vcat(["a", "b"], aa)

#or do push! for the above