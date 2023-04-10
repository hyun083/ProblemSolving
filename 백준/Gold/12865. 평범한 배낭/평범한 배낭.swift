import Foundation

let NK = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NK[0]   //물건갯수
let K = NK[1]   //최대무게
var dp = Array(repeating: Array(repeating: 0, count: K+1), count: N)
var item = [(Int,Int)]()

for _ in 0..<N{
    let WV = readLine()!.split(separator: " ").map{Int(String($0))!}
    item.append((WV[0],WV[1]))
}

for i in 0..<N{
    for k in 1...K{
        if i == 0{
            if k >= item[i].0{
                dp[i][k] = item[i].1
            }
        }else{
            if k < item[i].0{
                dp[i][k] = dp[i-1][k]
            }else{
                dp[i][k] = max(dp[i-1][k], dp[i-1][k-item[i].0] + item[i].1)
            }
        }
    }
}
print(dp[N-1][K])