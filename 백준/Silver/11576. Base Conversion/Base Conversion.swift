import Foundation

var ans = [String]()
let line = readLine()!.split(separator: " ").map{Int($0)!}
let M = Int(readLine()!)!
let num = Array(readLine()!.split(separator: " ").map{Int($0)!}.reversed())

let A = line[0]
let B = line[1]
var res = 0

for i in 0..<M{
    let tmp = NSDecimalNumber(decimal: pow(Decimal(A), i)).intValue * num[i]
    res += tmp
}

while res > 0{
    let tmp = res%B
    res /= B
    ans.append(String(tmp))
}
print(ans.reversed().joined(separator: " "))