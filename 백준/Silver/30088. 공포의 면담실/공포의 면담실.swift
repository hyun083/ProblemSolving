import Foundation

let N = Int(readLine()!)!
var tmp = [Int]()
for _ in 0..<N{
    var arr:[Int] = readLine()!.split(separator: " ").map{Int($0)!}.reversed()
    arr.removeLast()
    let time = arr.reduce(0,+)
    tmp.append(time)
}
tmp.sort(by:<)
var preSum = 0
var last = 0
for time in tmp{
    last += time
    preSum += last
}
print(preSum)