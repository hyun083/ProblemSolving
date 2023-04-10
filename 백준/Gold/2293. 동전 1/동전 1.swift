import Foundation

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0]
let k = nk[1]
var coins = [Int]()
for _ in 0..<n{
    coins.append(Int(readLine()!)!)
}
var dp = Array(repeating: UInt(0), count: k+1)
dp[0] = 1

for coin in coins{
    for j in 1...k{
        if coin <= j {
            dp[j] += dp[j-coin]
            if dp[j] > Int(pow(2.0, 31.0)){ dp[j] = 0 }
        }
    }
}
print(dp[k])