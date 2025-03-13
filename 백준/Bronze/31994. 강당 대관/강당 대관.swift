import Foundation

var ans = ""
var target = 0
for _ in 0..<7{
    let info = readLine()!.split(separator: " ").map{String($0)}
    let sub = info[0]
    let cnt = Int(info[1])!
    if target < cnt{
        target = cnt
        ans = sub
    }
}
print(ans)