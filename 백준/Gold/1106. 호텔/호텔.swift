import Foundation

let INF = 200000
let (C,N) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var city = [(cost:Int, value:Int)]()
var dp = Array(repeating: 0, count: INF)

for _ in 0..<N{
    let CV = readLine()!.split(separator: " ").map{Int($0)!}
    let cost = CV[0]
    let value = CV[1]
    city.append((cost,value))
}

for i in 0..<N{
    for target in city[i].cost..<INF{
        dp[target] = max(dp[target],dp[target-city[i].cost] + city[i].value)
    }
}
var ans = 0
for i in 0..<INF{
    if dp[i]>=C{
        ans = i
        break
    }
}
print(ans)