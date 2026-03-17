import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var cnt = 0

for num in 0...N+M {
    for x in 0...N {
        for y in 0...M {
            cnt += x+y==num ? 1 : 0
        }
    }
}
print(cnt)