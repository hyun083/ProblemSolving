import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]
var subject = [(i:Int, t:Int)]()
var dp = Array(repeating: Array(repeating: 0, count: N+1), count: K+1)
subject.append((0,0))

for _ in 0..<K{
    let IT = readLine()!.split(separator: " ").map{Int($0)!}
    let I = IT[0]
    let T = IT[1]
    subject.append((I,T))
}

for i in 1...K{
    let s = subject[i]
    for target in 1...N{
        if target < s.t {
            dp[i][target] = dp[i-1][target]
        }else{
            dp[i][target] = max(dp[i-1][target], dp[i-1][target-s.t]+s.i)
        }
    }
}
print(dp[K][N])