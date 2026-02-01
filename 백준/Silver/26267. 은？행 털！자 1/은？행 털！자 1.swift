import Foundation

let N = Int(readLine()!)!
var arr = Dictionary<Int,Int>()
for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let X = info[0]
    let T = info[1]
    let C = info[2]
    let diff = T-X
    arr[diff, default: 0] += C
}
print(arr.values.max()!)