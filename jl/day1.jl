f = open("./data/day1.txt", "r")

data = readlines(f)

xx = parse.(Int64, replace.(data, r"^$"=>"0", count = 1))

#Part 1

inds = vcat(0, findall(x -> (x == 0), xx))

#needed stack overflow to help me with the splitting
#https://stackoverflow.com/questions/63738953/julia-idiomatic-way-to-split-vector-to-subvectors-based-on-condition
y = getindex.(Ref(xx), (:).(inds[1:end-1].+1, inds[2:end]))

z = sum.(y)

maximum(z)

# Part 2

sum(sort(z, rev = true)[1:3])
