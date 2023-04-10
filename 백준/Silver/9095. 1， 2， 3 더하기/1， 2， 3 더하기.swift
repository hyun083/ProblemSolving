import Foundation

let T = Int(readLine()!)!
var dp = Array(repeating: -1, count: 12)
var ans = ""

func cnt(num:Int) -> Int{
    if num == 1{
        return 1
    }
    if num == 2{
        return 2
    }
    if num == 3{
        return 4
    }
    
    if dp[num] != -1{
        return dp[num]
    }
    dp[num] = cnt(num: num-3) + cnt(num: num-2) + cnt(num: num-1)
    return dp[num]
}

for _ in 1...T{
    let N = Int(readLine()!)!
    ans += String(cnt(num: N)) + "\n"
}
print(ans)