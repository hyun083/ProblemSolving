import Foundation

let DP = readLine()!.split(separator: " ").map{Int($0)!}
let D = DP[0]
let P = DP[1]
var arr = [(length:Int, current:Int)]()

for _ in 0..<P{
    let LC = readLine()!.split(separator: " ").map{Int($0)!}
    let L = LC[0]
    let C = LC[1]
    
    arr.append((L,C))
}

var dp = Array(repeating: 0, count: D+1)
dp[0] = Int.max

for i in 0..<P{
    let tube = arr[i]
    for target in stride(from: D, through: 0, by: -1){
        if target < tube.length { break }
        dp[target] = max(dp[target], min(dp[target-tube.length], tube.current))
    }
}
print(dp[D])