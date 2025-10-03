import Foundation

let NX = readLine()!.split(separator: " ").map{Int($0)!}
let N = NX[0]
let X = NX[1]
var ans = -1

for _ in 0..<N{
    let ST = readLine()!.split(separator: " ").map{Int($0)!}
    let S = ST[0]
    let T = ST[1]
    ans = S+T<=X ? max(ans, S) : ans
}
print(ans)