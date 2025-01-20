import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let N = Int(readLine()!)!
    let arr = [0]+readLine()!.split(separator:" ").map{Int($0)!}
    var dp = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
    var sum = Array(repeating: 0, count: N+1)
    sum[0] = arr[0]
    for i in 1...N{
        sum[i] += arr[i] + sum[i-1]
    }
    for i in 1..<N{
        for k in 1...N-i{
            dp[k][k+i] = Int.max
            for p in k..<k+i{
                dp[k][k+i] = min(dp[k][k+i], dp[k][p]+dp[p+1][k+i] + sum[k+i]-sum[k-1])
            }
        }
    }
    print(dp[1][N])
}