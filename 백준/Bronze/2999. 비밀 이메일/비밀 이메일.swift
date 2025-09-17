import Foundation

let msg = readLine()!.map{String($0)}
let N = msg.count
var num = 1
var R = -1
var C = -1

while num <= N{
    if N%num==0 && num<=(N/num){
        R = num
        C = N/num
    }
    num += 1
}
var ans = Array(repeating: Array(repeating: "", count: C), count: R)
var idx = 0

for k in 0..<C{
    for i in 0..<R{
        ans[i][k] = msg[idx]
        idx += 1
    }
}
print(ans.flatMap({$0.joined(separator: "")}).joined())