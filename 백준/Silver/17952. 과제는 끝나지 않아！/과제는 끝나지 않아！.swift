import Foundation

let N = Int(readLine()!)!
var stk = [(score:Int, remain:Int)]()
var ans = 0

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    if info[0] == 1{
        stk.append((info[1],info[2]))
    }
    if stk.isEmpty{ continue }
    var top = stk.removeLast()
    top.remain -= 1
    if top.remain == 0{
        ans += top.score
    }else{
        stk.append(top)
    }
}
print(ans)