import Foundation

let NMK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]
var score = Dictionary<String, Int>()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{String($0)}
    let subject = info[0]
    let value = Int(info[1])!
    score[subject] = value
}
var resMin = 0
var resMax = 0
for _ in 0..<K{
    let target = readLine()!
    if score[target] != nil{
        resMin += score[target]!
        resMax += score[target]!
        score.removeValue(forKey: target)
    }
}

var tmp = score.sorted(by: {$0.value > $1.value})
for _ in 0..<M-K{
    resMin += tmp.removeLast().value
}

tmp = score.sorted(by: {$0.value < $1.value})
for _ in 0..<M-K{
    resMax += tmp.removeLast().value
}
print(resMin, resMax)