import Foundation

let str = readLine()!.map{String($0)}
let target = "SciComLove".map{String($0)}
var cnt = 0

for i in 0..<10{
    cnt += str[i] == target[i] ? 0 : 1
}
print(cnt)