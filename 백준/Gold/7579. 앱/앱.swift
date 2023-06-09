import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var mem = [0]+readLine()!.split(separator: " ").map{Int($0)!}
var cost = [0]+readLine()!.split(separator: " ").map{Int($0)!}
var sum = cost.reduce(0, +)
var dp = Array(repeating: Array(repeating: 0, count: sum+1), count: N+1)

for i in 1...N{
    for currCost in 0...sum{
        if currCost-cost[i] >= 0{
            dp[i][currCost] = dp[i-1][currCost-cost[i]]+mem[i]
        }
        dp[i][currCost] = max(dp[i][currCost], dp[i-1][currCost])
        
    }
}

for cost in 0...sum{
    if dp[N][cost] >= M{
        print(cost)
        break
    }
}