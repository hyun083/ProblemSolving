import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var arr = [Int]()
for i in 1...N{
    if N%i == 0{
        arr.append(i)
    }
}
arr.sort(by: <)
print(arr.count < K ? 0:arr[K-1])