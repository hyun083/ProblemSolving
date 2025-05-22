import Foundation

let NMK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]
var tmp:[Float] = Array(repeating: 0.0, count: N)

for _ in 0..<M{
    let arr = readLine()!.split(separator: " ").map{String($0)}
    for i in stride(from: 0, to: arr.count, by: +2){
        let num = Int(arr[i])!-1
        let score = Float(arr[i+1])!
        tmp[num] = max(tmp[num],score)
    }
}
tmp.sort(by: >)
var ans:Float = 0.0

for i in 0..<K{
    ans += tmp[i]
}
print(round(ans*10)/10)