import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var ans = 0

for _ in 0..<N{
    let S = readLine()!.map{String($0)}.filter({$0=="O"})
    ans += S.count > M/2 ? 1:0
}
print(ans)