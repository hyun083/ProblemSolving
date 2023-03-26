import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: -1, count: 91)

func pin(num:Int) -> Int{
    if num == 1 || num == 2{
        return 1
    }
    if num == 3{
        return 2
    }
    if dp[num] != -1{
        return dp[num]
    }
    dp[num] = pin(num: num-1) + pin(num: num-2)
    return dp[num]
}
print(pin(num: N))