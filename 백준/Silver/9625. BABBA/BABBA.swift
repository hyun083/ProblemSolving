import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)

func fibonacci(num:Int) -> Int{
    if num == 0{
        return 0
    }
    if num == 1{
        return 1
    }
    if dp[num] != 0 {
        return dp[num]
    }
    
    dp[num] = fibonacci(num: num-1) + fibonacci(num: num-2)
    return dp[num]
}

print(fibonacci(num: N-1), fibonacci(num: N))