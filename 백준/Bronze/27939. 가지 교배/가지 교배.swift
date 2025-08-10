import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ $0=="W" }
let MK = readLine()!.split(separator: " ").map{Int($0)!}
let M = MK[0]
let K = MK[1]
var ans = [Bool]()
for _ in 0..<M{
    let input = readLine()!.split(separator: " ").map{ return arr[Int($0)!-1] }.reduce(true, { $0 && $1 })
    ans.append(input)
}
print(ans.reduce(ans[0], {$0 || $1}) ? "W":"P")