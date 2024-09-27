import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var arr = [[Int]]()

for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append(line)
}
var ans = 0

for i in 0..<M-3{
    for k in i+1..<M-2{
        for p in k+1..<M{
            var res = 0
            for v in 0..<N{
                res += max(arr[v][i], max(arr[v][k], arr[v][p]))
            }
            ans = max(ans, res)
        }
    }
}
print(ans)