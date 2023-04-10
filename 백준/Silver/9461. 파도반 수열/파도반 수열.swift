import Foundation

let T = Int(readLine()!)!
var dp = Array(repeating: 0, count: 101)

func fibonacci(num:Int) -> Int{
    if num==1 || num==2 || num==3{
        return 1
    }
    if dp[num] != 0{
        return dp[num]
    }
    dp[num] = fibonacci(num: num-2) + fibonacci(num: num-3)
    return dp[num]
}
for _ in 1...T{
    print(fibonacci(num: Int(readLine()!)!))
}