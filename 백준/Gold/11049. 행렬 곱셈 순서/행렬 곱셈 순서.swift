import Foundation

let N = Int(readLine()!)!
var arr = [(N:Int, M:Int)]()
let INF = Int.max
var dp = Array(repeating: Array(repeating: 0, count: N), count: N)

for _ in 0..<N{
    let (n,m) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    arr.append((n,m))
}

if N>1{
    for range in 1..<N{
        for i in 0..<N-range{
            dp[i][i+range] = INF
            for k in i..<i+range{
                dp[i][i+range] = min(dp[i][i+range], dp[i][k]+dp[k+1][i+range] + (arr[i].N * arr[k].M * arr[i+range].M))
            }
        }
    }
    print(dp[0][N-1])
}else{
    print(0)
}