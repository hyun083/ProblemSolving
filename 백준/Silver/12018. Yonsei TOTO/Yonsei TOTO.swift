import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var tmp = [Int]()

for _ in 0..<N{
    let PL = readLine()!.split(separator: " ").map{Int($0)!}
    let P = PL[0]
    let L = PL[1]
    let arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
    if P >= L{
        tmp.append(arr[L-1])
    }else{
        tmp.append(1)
    }
}
tmp.sort(by: <)
while tmp.reduce(0, +) > M{
    tmp.removeLast()
}
print(tmp.count)