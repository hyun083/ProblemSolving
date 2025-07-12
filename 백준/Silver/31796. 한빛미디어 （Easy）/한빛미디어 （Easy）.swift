import Foundation

let N = Int(readLine()!)!
let price = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var ans = 1
var head = price[0]

for i in 1..<N{
    if price[i] >= head*2{
        head = price[i]
        ans += 1
    }
}
print(ans)