module RandomWalks
type RandomWalk
    α:: Float64
    n:: Int64
end
export RandomWalk

Base.start(::RandomWalk) = (0., 1)
Base.next(r::RandomWalk, stat::Tuple{Float64, Int64}) = let β = r.α*stat[1] + randn(); (β, (β, stat[2] + 1)) end
Base.done(r::RandomWalk, stat::Tuple{Float64, Int64}) = stat[2] > r.n
end

using RandomWalks
using Plots

plot([RandomWalk(0.5, 1000)...], label="α= 0.5")
plot!([RandomWalk(0.8, 1000)...], label="α= 0.8")
plot!([RandomWalk(0.9, 1000)...], label="α= 0.9")
plot!([RandomWalk(1, 1000)...], label="α= 1")

