import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let N = line[0], B = line[1], H = line[2], W = line[3]
var ans = 5000001

for _ in 0..<H{
    let price = Int(readLine()!)!
    let amount = readLine()!.split(separator: " ").map{Int($0)!}
    for cnt in amount{
        if cnt >= N{
            ans = min(ans, price*N)
        }
    }
}
print(ans>B ? "stay home" : ans)