import Foundation

let N = Int(readLine()!)!
var info = readLine()!.split(separator: " ").map{Int($0)!}
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var M = Int(readLine()!)!
var ans:[Int] = readLine()!.split(separator: " ").map{Int($0)!}.reversed()

for i in 0..<N{
    if info[i] == 0 {
        ans.append(arr[i])
    }
}

for _ in 0..<M{
    print(ans.removeLast(),terminator: " ")
}