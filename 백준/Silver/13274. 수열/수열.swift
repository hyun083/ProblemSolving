import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]
var arr = readLine()!.split(separator: " ").map{Int($0)!}

for _ in 0..<K{
    let LRX = readLine()!.split(separator: " ").map{Int($0)!}
    let L = LRX[0]-1
    let R = LRX[1]-1
    let X = LRX[2]
    var asc = arr.sorted(by: <)
    for i in L...R{
        asc[i] += X
    }
    arr = asc.sorted(by: <)
}
for num in arr{
    print(num,terminator: " ")
}