import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var num = 0
var ans = [String]()
var idx = 1

while ans.count < N*5{
    let tmp = String(num,radix:2).map{String($0)}
    ans += tmp
    num += 1
}

for i in 0..<N*5{
    if idx == K {
        print(ans[i],terminator: " ")
    }
    idx += 1
    if idx == N+1 {
        idx = 1
    }
}