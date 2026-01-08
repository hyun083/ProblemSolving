import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]
var arr = [Int]()
for num in 1...K{
    let res = String(String(N*num).reversed())
    arr.append(Int(res)!)
}
print(arr.max()!)