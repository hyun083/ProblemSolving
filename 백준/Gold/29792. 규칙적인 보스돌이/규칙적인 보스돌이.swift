import Foundation

let NMK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]

var arr = [Int]()
var monster = [(hp:Int, money:Int)]()
var res = [Int]()

for _ in 0..<N{
    let num = Int(readLine()!)!
    arr.append(num)
}

for _ in 0..<K{
    let PQ = readLine()!.split(separator: " ").map{Int($0)!}
    let P = PQ[0]
    let Q = PQ[1]
    monster.append((P,Q))
}

for i in 0..<N{
    var dp = Array(repeating: 0, count: 901)
    let attack = arr[i]
    for idx in 0..<K{
        let hp = monster[idx].hp
        let money = monster[idx].money
        for target in stride(from: 900, to: 0, by: -1){
            let t = hp/attack + (hp%attack>0 ? 1:0)
            if t > target { continue }
            dp[target] = max(dp[target], dp[target-t]+money)
        }
    }
    res.append(dp.last!)
}
res.sort(by: >)
let ans = Array(res[0..<M])
print(ans.reduce(0, +))