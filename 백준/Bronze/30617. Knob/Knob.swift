import Foundation

let T = Int(readLine()!)!
let LR = readLine()!.split(separator: " ").map{Int($0)!}
var prevL = LR[0]
var prevR = LR[1]
var ans = prevL != 0 && prevL==prevR ? 1:0

for _ in 0..<T-1{
    let LR = readLine()!.split(separator: " ").map{Int($0)!}
    ans += LR[0] != 0 && prevL==LR[0] ? 1:0
    ans += LR[1] != 0 && prevR==LR[1] ? 1:0
    prevL = LR[0]
    prevR = LR[1]
    if prevL != 0 && prevR != 0{
        ans += prevL==prevR ? 1:0
    }
}
print(ans)