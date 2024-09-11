import Foundation

let NMK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]
var arr = [(dx:Int, dy:Int)]()
var dp = Array(repeating: Array(repeating: 0, count: K+1), count: M+1)
var ans = 0

for _ in 0..<N{
    let XY = readLine()!.split(separator: " ").map{Int($0)!}
    let X = XY[0]
    let Y = XY[1]
    
    arr.append((X,Y))
}

for i in 0..<N{
    let order = arr[i]
    for x in stride(from: M, through: 0, by: -1){
        for y in stride(from: K, through: 0, by: -1){
            if order.dx > x || order.dy > y { continue }
            dp[x][y] = max(dp[x-order.dx][y-order.dy]+1,dp[x][y])
            ans = max(ans, dp[x][y])
        }
    }
}
print(ans)