import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var tmp = [Int]()

tmp.append(arr[N-1]*arr[N-2])
tmp.append(arr[N-1]*arr[N-2]*arr[N-3])
tmp.append(arr[0]*arr[1]*arr[N-1])
tmp.append(arr[0]*arr[1])
print(tmp.max()!)