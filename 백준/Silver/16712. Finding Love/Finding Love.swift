import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var arr = readLine()!.split(separator: " ").map{Int($0)!}
var V = readLine()!.split(separator: " ").map{Int($0)!-1}
var info = [(pos:Int, value:Int)]()
var tmp = info

for i in 0..<N{
    info.append((i,arr[i]))
}
info.reverse()

for _ in 0..<M{
    tmp.append(info.removeLast())
}

for i in 0..<N-M+1{
    tmp.sort(by: {$0.value==$1.value ? $0.pos<$1.pos:$0.value<$1.value})
    let v = V[i]
    tmp.remove(at: v)
    if !info.isEmpty{
        tmp.append(info.removeLast())
    }
}

for ans in tmp{
    print(ans.value,terminator:" ")
}