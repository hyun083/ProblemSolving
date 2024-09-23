import Foundation

let N = Int(readLine()!)!
var origin = readLine()!.split(separator: " ").map{Int($0)!}
var target = readLine()!.split(separator: " ").map{Int($0)!}
var arr = [Int]()

for i in 0..<N{
    arr.append(target[i]-origin[i])
}

var dp = Array(repeating: 0, count: N)
dp[0] = abs(arr[0])

for i in 0..<N-1{
    if arr[i]*arr[i+1] < 0{
        dp[i+1] = dp[i]+abs(arr[i+1])
    }else{
        let pre = abs(arr[i])
        let next = abs(arr[i+1])
        if pre > next{
            dp[i+1] = dp[i]
        }else{
            dp[i+1] = dp[i] + next-pre
        }
    }
}
print(dp[N-1])