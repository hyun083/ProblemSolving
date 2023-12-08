import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var height = readLine()!.split(separator: " ").map{Int($0)!}
var arr = [Int]()

for i in 0..<N-1{
    arr.append(height[i+1]-height[i])
}
arr.sort(by: <)
print(arr[0..<N-K].reduce(0, +))