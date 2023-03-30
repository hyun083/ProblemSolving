import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: N)
var dp = Array(repeating: [Int](), count: N)

for i in 0..<N{
    let number = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i] = number
    dp[i] = number
}

if N == 1{
    print(arr[0][0])
}else if N == 2{
    print(arr[0][0] + max(arr[1][0], arr[1][1]))
}else{
    dp[0][0] = arr[0][0]
    dp[1][0] += dp[0][0]
    dp[1][1] += dp[0][0]
    for i in 2..<N{
        for k in 0..<arr[i].count{
            if k == 0{
                dp[i][k] += dp[i-1][k]
            }else if k == arr[i].count-1{
                dp[i][k] += dp[i-1][k-1]
            }else{
                dp[i][k] += max(dp[i-1][k-1], dp[i-1][k])
            }
        }
    }
    print(dp[N-1].max()!)
}