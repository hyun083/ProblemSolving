import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var temp = 0
var ans = 0
for a in arr{
    let num = temp + a
    ans += num
    temp = num
}
print(ans)