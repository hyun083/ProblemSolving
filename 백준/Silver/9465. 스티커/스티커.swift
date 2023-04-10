let T = Int(readLine()!)!

for _ in 1...T{
    let N = Int(readLine()!)!
    var dp = [[Int]]()
    dp.append([0] + (readLine()!.split(separator: " ").map{Int(String($0))!}))
    dp.append([0] + (readLine()!.split(separator: " ").map{Int(String($0))!}))
    if N == 1{
        print(max(dp[0][N], dp[1][N]))
    }else{
        for i in 2...N{
            dp[0][i] = max(dp[1][i-1],dp[1][i-2]) + dp[0][i]
            dp[1][i] = max(dp[0][i-1], dp[0][i-2]) + dp[1][i]
        }
        print(max(dp[0][N], dp[1][N]))
    }
}