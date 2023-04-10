var dp = Array(repeating: 0, count: 116)
let n = Int(readLine()!)!
for i in 0..<3{
    dp[i] = 1
}
func solution(num:Int) -> Int{
    if dp[num] != 0{
        return dp[num]
    }else{
        dp[num] = solution(num: num-1) + solution(num: num-3)
        return dp[num]
    }
}

print(solution(num: n-1))