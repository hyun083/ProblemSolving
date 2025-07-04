import Foundation

let N = Int(readLine()!)!
let benefit = readLine()!.split(separator: " ").map{Int($0)!}
let price = readLine()!.split(separator: " ").map{Int($0)!}
let maxBenefit = benefit.sorted(by: >)
var ans = [Int]()

for i in 0..<N{
    let max = benefit[i] == maxBenefit[0] ? maxBenefit[1]:maxBenefit[0]
    let diff = benefit[i] - (max - price[i]) - price[i]
    ans.append(diff)
}

for ans in ans{
    print(ans,terminator: " ")
}