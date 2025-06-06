import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]
var arr = [Int]()

for _ in 0..<N{
    let AB = readLine()!.split(separator: " ").map{Int($0)!}
    let A = AB[0]
    let B = AB[1]
    arr.append(B-A<=0 ? 0:B-A)
}
arr.sort(by:<)
print(arr[K-1])