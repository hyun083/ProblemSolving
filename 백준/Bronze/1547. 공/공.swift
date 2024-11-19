import Foundation

let M = Int(readLine()!)!
var arr = [1,2,3]

for _ in 0..<M{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let u = arr.firstIndex(of: info[0])!
    let v = arr.firstIndex(of: info[1])!
    
    arr.swapAt(u, v)
}
print(arr[0])