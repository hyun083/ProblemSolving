import Foundation

let target = readLine()!.map{String($0)}
let N = Int(readLine()!)!
var ans = 0
for _ in 0..<N{
    let code = readLine()!.map{String($0)}
    var res = true
    for i in 0..<5{
        if target[i] != code[i]{
            res = false
            break
        }
    }
    ans += res ? 1 : 0
}
print(ans)