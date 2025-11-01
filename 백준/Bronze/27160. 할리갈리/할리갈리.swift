import Foundation

let N = Int(readLine()!)!
var dict = [String:Int]()
var ans = false
for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{String($0)}
    let fruit = info[0]
    let num = Int(info[1])!
    dict[fruit, default:0] += num
}
for cnt in dict.values{
    if cnt == 5{
        ans = true
        break
    }
}
print(ans ? "YES":"NO")