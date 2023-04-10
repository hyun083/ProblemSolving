import Foundation

var k = 0
while let input = readLine(){
    k += 1
    let n = Int(input)!
    if n == 0{
        break
    }
    var dp = [[Int]]()
    for _ in 0..<n{
        dp.append(readLine()!.split(separator: " ").map{Int($0)!})
    }
    dp[0][2] += dp[0][1]
    dp[1][0] += dp[0][1]
    dp[1][1] += min(dp[1][0], min(dp[0][1], dp[0][2]))
    dp[1][2] += min(dp[1][1], min(dp[0][1], dp[0][2]))
    
    if n > 2{
        for i in 2..<n{
            dp[i][0] += min(dp[i-1][0], dp[i-1][1])
            dp[i][1] += min(min(dp[i][0], dp[i-1][0]), min(dp[i-1][1], dp[i-1][2]))
            dp[i][2] += min(min(dp[i][1], dp[i-1][1]), dp[i-1][2])
        }
    }
    print("\(k).",dp[n-1][1])
}