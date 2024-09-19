import Foundation

let HN = readLine()!.split(separator: " ").map{Int($0)!}
let H = HN[0]
let N = HN[1]

var arr = [Int]()
for _ in 0..<N{
    let W = Int(readLine()!)!
    arr.append(W)
}

var dp = Array(repeating: 0, count: H+1)
for i in 0..<N{
    let curr = arr[i]
    for target in stride(from: H, through: 0, by: -1){
        if target < curr { continue }
        dp[target] = max(dp[target], dp[target-curr]+curr)
    }
}
print(dp[H])