import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Double($0)!}.sorted(by: >)
while arr.count>1{
    let pop = arr.removeLast()/2
    arr[0] += pop
}
print(arr[0])