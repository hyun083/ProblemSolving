import Foundation

let N = Int(readLine()!)!
var ans = Array(repeating: Array(repeating: 0, count: 4), count: 100001)
let MOD = 1000000009

ans[1][1] = 1
ans[2][2] = 1
ans[3][1] = 1
ans[3][2] = 1
ans[3][3] = 1

for i in 4..<100001{
    ans[i][1] = (ans[i-1][2]+ans[i-1][3])%MOD
    ans[i][2] = (ans[i-2][1]+ans[i-2][3])%MOD
    ans[i][3] = (ans[i-3][1]+ans[i-3][2])%MOD
}

for _ in 0..<N{
    let num = Int(readLine()!)!
    let res = ans[num][1] + ans[num][2] + ans[num][3]
    print(res%MOD)
}