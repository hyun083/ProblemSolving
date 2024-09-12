import Foundation

let NT = readLine()!.split(separator: " ").map{Int($0)!}
let N = NT[0]
let T = NT[1]
var arr = [(day:Int, fine:Int)]()
var total = 0

for _ in 0..<N{
    let DM = readLine()!.split(separator: " ").map{Int($0)!}
    let D = DM[0]
    let M = DM[1]
    arr.append((D,M))
    total += M
}

var dp = Array(repeating: 0, count:T+1)

for i in 0..<N{
    let prob = arr[i]
    for target in stride(from: T, through: 0, by:-1){
        if target < prob.day { continue }
        dp[target] = max(dp[target], dp[target-prob.day]+prob.fine)
    }
}
print(total - dp[T])