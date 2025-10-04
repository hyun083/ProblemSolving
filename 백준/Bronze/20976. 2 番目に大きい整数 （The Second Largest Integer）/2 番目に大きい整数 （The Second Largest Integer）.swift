import Foundation

let arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
print(arr[1])