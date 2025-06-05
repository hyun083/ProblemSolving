import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var cost = [Int]()
var target = Array(repeating: 0, count: N)
for _ in 0..<N{
    cost.append(Int(readLine()!)!)
}
for _ in 0..<M{
    let B = Int(readLine()!)!
    for i in 0..<N{
        if cost[i] <= B{
            target[i] += 1
            break
        }else{
            continue
        }
    }
}
for i in 0..<N{
    if target[i] == target.max()!{
       print(i+1)
       break
    }
}