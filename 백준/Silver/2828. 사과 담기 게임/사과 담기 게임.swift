import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let N = info[0]
let M = info[1]

let J = Int(readLine()!)!
var S = 0
var E = M-1
var ans = 0

for _ in 0..<J{
    let pos = Int(readLine()!)!-1
    if S <= pos && pos <= E{ continue }
    
    var move = 0
    if E < pos{
        move = pos-E
    }else if pos < S{
        move = pos-S
    }
    S += move
    E += move
    ans += abs(move)
    
}
print(ans)