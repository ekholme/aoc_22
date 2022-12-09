stks = readlines("./data/day5_stacks.txt")
instructs = readlines("./data/day5_dirs.txt")

#format stacks

z = split.(stks, "")

base_len = length(z[1])

pos = collect(2:4:base_len)

m = mapreduce(permutedims, vcat, z)

m = m[:, pos]

stacks = [Vector{String}(m[:, i]) for i in 1:9]

stacks = filter.(!=(" "), stacks)

#format instructions

function parse_instructs(x)
    return parse.(Int, split(replace(x, r"\D+" => " "), " ")[2:4])
end

inst = parse_instructs.(instructs)

#Part 1

#pattern -- move 1 from 7 to 6; move 1 from 9 to 4; etc

for i in eachindex(inst)
    tmp = reverse(stacks[inst[i][2]][1:inst[i][1]])

    deleteat!(stacks[inst[i][2]], 1:inst[i][1])

    stacks[inst[i][3]] = vcat(tmp, stacks[inst[i][3]])
end

#print out top crates
for i in eachindex(stacks)
    println(stacks[i][1])
end

#Part 2

#need to re-read in our stacks...zzzz
stacks = [Vector{String}(m[:, i]) for i in 1:9]

stacks = filter.(!=(" "), stacks)

#and then just do the same loop but without reverse()
for i in eachindex(inst)
    tmp = stacks[inst[i][2]][1:inst[i][1]]

    deleteat!(stacks[inst[i][2]], 1:inst[i][1])

    stacks[inst[i][3]] = vcat(tmp, stacks[inst[i][3]])
end

#print out top crates
for i in eachindex(stacks)
    println(stacks[i][1])
end
