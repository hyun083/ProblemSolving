import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0

var dp = Array(repeating: 0, count: 1000001)

for i in 0..<N{
    let curr = arr[i]
    
    if dp[curr] == 0{
        ans += 1
    }else{
        dp[curr] -= 1
    }
    
    dp[curr-1] += 1
}

print(ans)