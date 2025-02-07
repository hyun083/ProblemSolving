import Foundation

let N = Int(readLine()!)!
var work = Array(repeating: [Int](), count: 1001)
var tmp = [Int]()
for _ in 0..<N{
    let DW = readLine()!.split(separator: " ").map{Int($0)!}
    let D = DW[0]
    let W = DW[1]
    work[D].append(W)
}

for i in 1...1000{
    let curr = work[i]
    tmp += curr
    tmp.sort(by: >)
    if tmp.count > i{
        tmp = Array(tmp[0..<i])
    }
}
print(tmp.reduce(0, +))