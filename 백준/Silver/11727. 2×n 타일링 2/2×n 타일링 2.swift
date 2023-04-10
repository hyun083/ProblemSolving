import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)

func tile(num:Int) -> Int{
    if num == 0{
        return 0
    }
    if num == 1{
        return 1
    }
    if num == 2{
        return 3
    }
    if dp[num] != 0{
        return dp[num]
    }
    dp[num] = (2*tile(num: num-2)%10007 + tile(num: num-1)%10007)%10007
    return dp[num]
}
print(tile(num: N))